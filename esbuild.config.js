const esbuild = require("esbuild");

const handleError = () => process.exit(1);
const build = (outfile, options = {}) => {
  const { format = "cjs" } = options;

  return esbuild
    .build({
      entryPoints: ["src/index.mjs"],
      bundle: true,
      format,
      platform: "neutral",
      outdir: `dist/${format}`,
      treeShaking: true,
      minify: false,
      logLevel: "info",
      legalComments: "none",
      external: [],
      ...options,
    })
    .catch(handleError);
};

// for node
build("index.js", { format: "cjs" });

// for browser
build("index.js", { format: "esm" });
