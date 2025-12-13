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
          -- remove when https://github.com/JohnnyMorganz/luau-lsp/pull/1290 is merged
          enabled = true,
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
