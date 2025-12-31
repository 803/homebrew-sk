#!/usr/bin/env bun

const version = process.argv[2]?.replace(/^sk@/, "");
if (!version) {
  console.error("Usage: bun update-formula.ts <tag>  (e.g., sk@0.1.0)");
  process.exit(1);
}

const REPO = "803/skills-supply";
const FORMULA_PATH = "Formula/sk.rb";

const platforms = [
  "darwin-arm64",
  "darwin-x64",
  "linux-arm64",
  "linux-x64",
];

// Fetch SHASUMS256.txt and parse hashes (faster than downloading all binaries)
const shasumsUrl = `https://github.com/${REPO}/releases/download/sk@${version}/SHASUMS256.txt`;
const response = await fetch(shasumsUrl);
if (!response.ok) {
  console.error(`Failed to fetch ${shasumsUrl}: ${response.status}`);
  process.exit(1);
}
const shasums = await response.text();
console.log("SHASUMS256.txt:\n" + shasums);

// Parse: "abc123...  sk-darwin-arm64/sk-darwin-arm64.tar.gz"
const hashes: Record<string, string> = {};
for (const line of shasums.trim().split("\n")) {
  const [hash, filename] = line.split(/\s+/);
  const platform = platforms.find((p) => filename.includes(`sk-${p}`));
  if (platform) {
    hashes[platform] = hash;
  }
}

// Verify we found all platform hashes
const missing = platforms.filter((p) => !hashes[p]);
if (missing.length > 0) {
  console.error(`Missing hashes for platforms: ${missing.join(", ")}`);
  process.exit(1);
}

console.log("\nParsed hashes:");
for (const [platform, hash] of Object.entries(hashes)) {
  console.log(`  ${platform}: ${hash}`);
}

// Update formula with new version and hashes
let formula = await Bun.file(FORMULA_PATH).text();
formula = formula.replace(/version "[^"]+"/, `version "${version}"`);

for (const [platform, hash] of Object.entries(hashes)) {
  const regex = new RegExp(`(sha256 ")[^"]+(" # sk-${platform})`);
  formula = formula.replace(regex, `$1${hash}$2`);
}

await Bun.write(FORMULA_PATH, formula);
console.log(`\nUpdated ${FORMULA_PATH} to sk@${version}`);

// Create versioned formula (e.g., sk@0.2.0.rb with class SkAT020)
const versionedClass = `class SkAT${version.replace(/\./g, "")}`;
const versionedFormula = formula.replace(/class Sk\b/, versionedClass);
const versionedPath = `Formula/sk@${version}.rb`;
await Bun.write(versionedPath, versionedFormula);
console.log(`Created ${versionedPath}`);
