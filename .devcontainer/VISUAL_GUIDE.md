# 🎨 Guia Visual - Como Usar o DevContainer

Este guia mostra passo a passo, de forma visual, como começar a usar o DevContainer.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter:

- ✅ **Docker** instalado e rodando
- ✅ **VS Code** instalado
- ✅ **Extensão Remote - Containers** instalada no VS Code

> 💡 **Dica**: Execute `.devcontainer/check-requirements.sh` para verificar automaticamente!

---

## 🚀 Passo 1: Abrir o Projeto

### Opção A: Via Terminal

```bash
cd /home/seduq/projects/todo-php
code .
```

### Opção B: Via VS Code

1. Abra o VS Code
2. File → Open Folder
3. Selecione a pasta `todo-php`

---

## 🔔 Passo 2: Notificação Automática

Quando você abrir o projeto, o VS Code detectará automaticamente o arquivo `.devcontainer/devcontainer.json` e mostrará uma notificação:

```
┌─────────────────────────────────────────────────────┐
│ Folder contains a Dev Container configuration file. │
│ Reopen in Container   [Don't Show Again]           │
└─────────────────────────────────────────────────────┘
```

**Clique em "Reopen in Container"**

---

## 🔧 Passo 3: Construção do Container (Primeira Vez)

O VS Code começará a construir o container. Você verá:

```
Starting Dev Container...
Building image...
[+] Building 45.2s (15/15) FINISHED
Creating container...
Starting container...
Configuring container...
Installing extensions...
Running postCreateCommand...
```

> ⏱️ **Tempo estimado na primeira vez**: 3-5 minutos
> ⚡ **Próximas vezes**: 10-30 segundos

---

## ✅ Passo 4: Container Pronto!

Quando terminar, você verá no canto inferior esquerdo:

```
┌─────────────────────────────────┐
│ >< Dev Container: Todo PHP      │
└─────────────────────────────────┘
```

E o terminal integrado estará dentro do container:

```bash
root@abc123:/var/www/html#
```

---

## 🎯 Passo 5: Verificar Instalação

Execute alguns comandos para verificar:

```bash
# Verificar versão do PHP
php -v
# PHP 8.2.x (cli) ...

# Verificar Composer
composer --version
# Composer version 2.x.x

# Verificar dependências
ls vendor/
# cakephp  composer  doctrine  ...

# Verificar permissões
ls -la tmp/ logs/
# drwxrwxrwx ...
```

---

## 🌐 Passo 6: Acessar a Aplicação

Abra seu navegador e acesse:

### 🎯 Aplicação Principal

```
http://localhost:8080
```

### 🗄️ PHPMyAdmin

```
http://localhost:8081
```

- **Servidor**: mysql
- **Usuário**: root
- **Senha**: root_password

---

## 🐛 Passo 7: Configurar Debug (Opcional)

### 7.1 Adicionar Breakpoint

1. Abra um arquivo PHP (ex: `app/src/Controller/PagesController.php`)
2. Clique à esquerda do número da linha para adicionar um breakpoint (bolinha vermelha)

### 7.2 Iniciar Debug

1. Pressione `F5` ou vá em **Run → Start Debugging**
2. Selecione: **Listen for Xdebug**

### 7.3 Testar

1. Acesse a aplicação no navegador: `http://localhost:8080`
2. O código pausará no breakpoint
3. Você poderá:
   - Inspecionar variáveis
   - Avançar linha por linha
   - Ver call stack
   - Etc.

---

## 📝 Passo 8: Usar Tasks do VS Code

Pressione `Ctrl+Shift+P` e digite `Tasks: Run Task`, então escolha:

### Opções Disponíveis:

- ✅ **CakePHP: Clear Cache** - Limpa cache da aplicação
- ✅ **CakePHP: Run Migrations** - Executa migrations do banco
- ✅ **Composer: Install** - Instala dependências
- ✅ **Composer: Update** - Atualiza dependências
- ✅ **Run PHPUnit Tests** - Executa todos os testes
- ✅ **PHPStan: Analyze** - Análise estática de código
- ✅ **PHPCS: Check Code Style** - Verifica padrões de código
- ✅ **PHPCBF: Fix Code Style** - Corrige automaticamente
- ✅ **Fix Permissions** - Corrige permissões de logs e tmp

---

## 🎨 Passo 9: Extensões Instaladas

Verifique as extensões instaladas automaticamente:

1. Clique no ícone de extensões (quadrado com 4 quadradinhos)
2. Você verá instalado:
   - 🐘 **PHP Intelephense** - Autocompletar avançado
   - 🐛 **PHP Debug** - Debug com Xdebug
   - 🐳 **Docker** - Gerenciar containers
   - 📝 **EditorConfig** - Formatação consistente
   - 🌳 **GitLens** - Git superpowered
   - ✅ **Todo Tree** - Rastrear TODOs
   - E mais...

---

## 💡 Dicas Úteis

### Abrir Terminal no Container

```
Ctrl+` (acento grave)
ou
Terminal → New Terminal
```

### Executar Comandos do CakePHP

```bash
bin/cake --help
bin/cake migrations status
bin/cake bake controller Todos
```

### Instalar Novo Pacote PHP

```bash
composer require vendor/package-name
```

### Ver Logs

```bash
tail -f logs/cli-error.log
tail -f logs/error.log
```

### Conectar ao MySQL

```bash
# Dentro do container PHP
mysql -h mysql -u todoapp -p
# Senha: todoapp_password
```

---

## 🔄 Comandos do VS Code

### Reabrir no Container

`F1` → `Dev Containers: Reopen in Container`

### Reabrir Localmente

`F1` → `Dev Containers: Reopen Folder Locally`

### Reconstruir Container

`F1` → `Dev Containers: Rebuild Container`

### Ver Logs do Container

`F1` → `Dev Containers: Show Container Log`

---

## 🛑 Parar o Container

### Opção 1: Fechar VS Code

Simplesmente feche o VS Code. Os containers continuarão rodando.

### Opção 2: Parar Containers

```bash
# Em outro terminal (fora do container)
cd /home/seduq/projects/todo-php
docker compose -f docker-compose.dev.yml down
```

### Opção 3: Parar e Remover Volumes

```bash
# ⚠️ CUIDADO: Isso apaga o banco de dados!
docker compose -f docker-compose.dev.yml down -v
```

---

## 🎓 Workflows Comuns

### Workflow 1: Desenvolver Nova Feature

```bash
# 1. Criar branch
git checkout -b feature/nova-funcionalidade

# 2. Desenvolver (com breakpoints e debug)
# ... código ...

# 3. Testar
vendor/bin/phpunit

# 4. Verificar qualidade
vendor/bin/phpstan analyse src
vendor/bin/phpcs src

# 5. Commit
git add .
git commit -m "feat: adiciona nova funcionalidade"
```

### Workflow 2: Corrigir Bug

```bash
# 1. Adicionar breakpoint no código problemático
# 2. Pressionar F5 para iniciar debug
# 3. Reproduzir o bug no navegador
# 4. Inspecionar variáveis no VS Code
# 5. Corrigir o problema
# 6. Testar novamente
```

### Workflow 3: Adicionar Dependência

```bash
# 1. Instalar via Composer
composer require vendor/package

# 2. Usar no código
# ... código ...

# 3. Testar
vendor/bin/phpunit

# 4. Commit composer.json e composer.lock
git add composer.json composer.lock
git commit -m "deps: adiciona vendor/package"
```

---

## 🆘 Troubleshooting

### Problema: Container não inicia

```bash
# Verificar logs
docker compose -f docker-compose.dev.yml logs

# Reconstruir do zero
docker compose -f docker-compose.dev.yml down -v
docker compose -f docker-compose.dev.yml build --no-cache
```

### Problema: Permissões negadas

```bash
# Dentro do container
chmod -R 777 logs tmp
```

### Problema: Banco não conecta

```bash
# Verificar se MySQL está rodando
docker compose -f docker-compose.dev.yml ps

# Ver logs do MySQL
docker compose -f docker-compose.dev.yml logs mysql
```

### Problema: Código não atualiza

```bash
# Limpar cache do CakePHP
bin/cake cache clear_all
```

---

## 📚 Próximos Passos

Agora que você sabe usar o DevContainer:

1. 📖 Leia [.devcontainer/README.md](.devcontainer/README.md) para mais detalhes
2. 📋 Confira [.devcontainer/SETUP_SUMMARY.md](.devcontainer/SETUP_SUMMARY.md) para entender a estrutura
3. 🎯 Explore as tasks do VS Code (`Ctrl+Shift+P` → `Tasks: Run Task`)
4. 🐛 Configure seu debug favorito
5. 💻 Comece a desenvolver!

---

## 🎉 Conclusão

Você agora tem um ambiente de desenvolvimento:

- ✅ Totalmente configurado
- ✅ Consistente entre todos os desenvolvedores
- ✅ Com debug funcionando
- ✅ Com ferramentas de qualidade
- ✅ Isolado do seu sistema
- ✅ Versionado no Git

**Happy Coding! 🚀**
