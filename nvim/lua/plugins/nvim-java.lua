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
            jdtls={
                init_options = {
                    workspace = function ()
                        local root = vim.fs.root(0, {
                            'gradlew', 'settings.gradle', 'settings.gradle.kts',
                            'build.gradle', 'build.gradle.kts', 'pom.xml', 'mvnw', '.git'
                        }) or vim.fn.getcwd()
                        local project_name = vim.fn.fnamemodify(root, ':t')
                        local workspace_dir = '~/projects/' .. 'projects-meta/' .. project_name
                        return workspace_dir
                    end
                },
                workspace_dir = function(project_root)
                    return "~/projects/projects-meta/" .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(project_root, ":p:h:t")
                end,
            }
        })
        vim.lsp.enable('jdtls')
        local dap = require("dap")

        local root = vim.fs.root(0, {
            'gradlew', 'settings.gradle', 'settings.gradle.kts',
            'build.gradle', 'build.gradle.kts', 'pom.xml', 'mvnw', '.git'
        }) or vim.fn.getcwd()
        local project_name = vim.fn.fnamemodify(root, ':t')
        local workspace_dir = '~/projects/' .. 'projects-meta/' .. project_name

        vim.lsp.config('jdtls', {
            workspace = workspace_dir,
            init_options = {
                workspace = workspace_dir,
            },
        })
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
                        print("setting up workspace_dir")
                        local root = vim.fs.root(0, {
                            'gradlew', 'settings.gradle', 'settings.gradle.kts',
                            'build.gradle', 'build.gradle.kts', 'pom.xml', 'mvnw', '.git'
                        }) or vim.fn.getcwd()
                        local project_name = vim.fn.fnamemodify(root, ':t')
                        local workspace_dir = '~/projects/' .. 'projects-meta/' .. project_name

                        vim.lsp.config('jdtls', {
                            init_options = {
                                workspace = workspace_dir,
                            },
                        })
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
