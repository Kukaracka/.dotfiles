-- yaml-language-server: убирает ложные «Unresolved tag: !reference» в .gitlab-ci.yml
-- (регистрирует кастомный тег !reference в парсере) и подключает
-- официальную схему GitLab CI для валидации и автодополнения.
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            customTags = { "!reference sequence" },
            schemas = {
              ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
            },
          },
        },
      },
    },
  },
}