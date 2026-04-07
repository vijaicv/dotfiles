return {
{
    'nvim-java/nvim-java',
    config = function()
        -- nvim-java pkgm only ships OpenJDK 17 and 25 (no 21). jdtls runs on default JDK (25).
        require('java').setup({
            root_markers = {
                'gradlew',
                'settings.gradle',
                'settings.gradle.kts',
                'build.gradle',
                'pom.xml',
                'mvnw',
                'build.gradle',
                'build.gradle.kts'
            },
            jdk = {
                auto_install = false,
            },
        })
        vim.lsp.enable('jdtls')
        local dap = require("dap")

        dap.configurations.java = {
          {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote";
            hostName = "localhost";
            port = 5005;
            mainClass = {}
          },
        }
    end,
    dependencies = {
        {
            'neovim/nvim-lspconfig',
            opts = {
                servers = {
                    jdtls = {
                    },
                },
                setup = {
                    java = {
                        import = {
                            generateMetadataFilesAtProjectRoot = false,
                        },
                    },
                    settings = {
                        java = {
                            import = {
                                generateMetadataFilesAtProjectRoot = false,
                            },
                        },
                    },
                    jdtls = function()
                    end,
                },
            },
        },
        {
            'williamboman/mason.nvim',
            opts = {
                -- Add the nvim-java registry to Mason
                registries = {
                    'github:nvim-java/mason-registry',
                    'github:mason-org/mason-registry',
                },
            },
        },
    },
    ft = 'java',
},
}
