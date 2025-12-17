local ignore_globs = {
  "**/_Index/**",
  "**/.pesde/**",
  "node_modules/**",
  "build/**",
}

return {
  settings = {
    ["luau-lsp"] = {
      ignoreGlobs = ignore_globs,
      completion = {
        imports = {
          ignoreGlobs = ignore_globs,
        },
        addParentheses = false,
        fillCallArguments = false,
      },
      inlayHints = {
        functionReturnTypes = true,
        parameterTypes = true,
      },
    },
  },
}
