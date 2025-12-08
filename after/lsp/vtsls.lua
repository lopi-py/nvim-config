return {
  settings = {
    typescript = {
      updateImportsOnFileMove = "always",
    },
    javascript = {
      updateImportsOnFileMove = "always",
    },
    vtsls = {
      autoUseWorkspaceTsdk = true,
      enableMoveToFileCodeAction = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
  },
}
