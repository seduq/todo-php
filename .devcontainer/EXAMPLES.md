# 🧪 Exemplos Práticos - DevContainer

Este arquivo contém exemplos práticos e prontos para usar no seu DevContainer.

## 📦 Gerenciamento de Dependências

### Adicionar Pacote Específico

```bash
# Exemplo: Adicionar biblioteca de manipulação de imagens
composer require intervention/image

# Exemplo: Adicionar biblioteca de paginação
composer require cakephp/pagination
```

### Adicionar Pacote de Desenvolvimento

```bash
# Exemplo: Adicionar biblioteca de mock para testes
composer require --dev mockery/mockery

# Exemplo: Adicionar ferramenta de documentação
composer require --dev phpDocumentor/phpDocumentor
```

### Remover Pacote

```bash
composer remove vendor/package-name
```

### Atualizar Pacote Específico

```bash
composer update vendor/package-name
```

---

## 🍰 CakePHP - Comandos Úteis

### Baking (Geração de Código)

#### Criar Controller

```bash
# Controller básico
bin/cake bake controller Todos

# Controller com ações específicas
bin/cake bake controller Todos --actions index,view,add,edit,delete

# Controller de API
bin/cake bake controller Todos --prefix api
```

#### Criar Model (Table + Entity)

```bash
# Model completo
bin/cake bake model Todos

# Apenas Table
bin/cake bake model Todos --no-entity

# Apenas Entity
bin/cake bake model Todos --no-table
```

#### Criar Template

```bash
# Templates CRUD completos
bin/cake bake template Todos

# Template específico
bin/cake bake template Todos index
```

#### Criar Fixture (para testes)

```bash
bin/cake bake fixture Todos
```

#### Criar Shell/Command

```bash
bin/cake bake command SendEmail
```

### Migrations

#### Criar Migration

```bash
# Migration em branco
bin/cake bake migration CreateTodos

# Migration baseada na tabela existente
bin/cake bake migration_snapshot Initial
```

#### Executar Migrations

```bash
# Executar todas pendentes
bin/cake migrations migrate

# Executar até versão específica
bin/cake migrations migrate --target=20231006120000

# Rollback última migration
bin/cake migrations rollback

# Status das migrations
bin/cake migrations status
```

### Cache

```bash
# Limpar todo cache
bin/cake cache clear_all

# Limpar cache específico
bin/cake cache clear _cake_core_
bin/cake cache clear _cake_model_
```

### Rotas

```bash
# Listar todas as rotas
bin/cake routes

# Verificar rota específica
bin/cake routes check /todos/add
```

### Schema

```bash
# Gerar SQL do schema
bin/cake schema_cache build

# Limpar cache do schema
bin/cake schema_cache clear
```

---

## 🧪 Testes

### Executar Todos os Testes

```bash
vendor/bin/phpunit
```

### Executar Teste Específico

```bash
# Por arquivo
vendor/bin/phpunit tests/TestCase/Controller/TodosControllerTest.php

# Por classe
vendor/bin/phpunit --filter TodosControllerTest

# Por método
vendor/bin/phpunit --filter testAdd
```

### Testes com Coverage

```bash
# Gerar relatório HTML
vendor/bin/phpunit --coverage-html coverage/

# Gerar relatório texto
vendor/bin/phpunit --coverage-text
```

### Criar Novo Teste

```bash
bin/cake bake test Controller Todos
bin/cake bake test Table Todos
```

---

## 🔍 Análise de Código

### PHPStan (Análise Estática)

```bash
# Análise completa
vendor/bin/phpstan analyse src

# Análise específica
vendor/bin/phpstan analyse src/Controller/TodosController.php

# Com nível específico (0-9, 9 é mais rigoroso)
vendor/bin/phpstan analyse src --level=8
```

### PHPCS (Code Sniffer)

```bash
# Verificar todo o código
vendor/bin/phpcs src

# Verificar arquivo específico
vendor/bin/phpcs src/Controller/TodosController.php

# Verificar com padrão específico
vendor/bin/phpcs --standard=PSR12 src

# Mostrar apenas warnings
vendor/bin/phpcs --warning-severity=0 src
```

### PHPCBF (Correção Automática)

```bash
# Corrigir todo o código
vendor/bin/phpcbf src

# Corrigir arquivo específico
vendor/bin/phpcbf src/Controller/TodosController.php
```

### Psalm (Análise Estática Alternativa)

```bash
# Se estiver instalado
vendor/bin/psalm

# Análise específica
vendor/bin/psalm src/Controller/
```

---

## 🗄️ Banco de Dados

### MySQL CLI (dentro do container PHP)

```bash
# Conectar ao banco
mysql -h mysql -u todoapp -ptodoapp_password todoapp

# Ou com prompt de senha
mysql -h mysql -u todoapp -p todoapp
```

### Comandos SQL Úteis

```sql
-- Ver todas as tabelas
SHOW TABLES;

-- Descrever estrutura de tabela
DESCRIBE todos;

-- Ver todos os registros
SELECT * FROM todos;

-- Contar registros
SELECT COUNT(*) FROM todos;

-- Ver últimos 10 registros
SELECT * FROM todos ORDER BY id DESC LIMIT 10;
```

### Dump do Banco

```bash
# Fazer backup
docker exec todoapp_mysql_dev mysqldump -u root -proot_password todoapp > backup.sql

# Restaurar backup
docker exec -i todoapp_mysql_dev mysql -u root -proot_password todoapp < backup.sql
```

---

## 🐛 Debug

### Debug com Xdebug

#### Método 1: Via Navegador

1. Adicione breakpoint no código (clique à esquerda da linha)
2. Pressione `F5` no VS Code
3. Acesse a aplicação no navegador
4. O código pausará no breakpoint

#### Método 2: Via CLI

```bash
# Configure XDEBUG_SESSION
export XDEBUG_SESSION=1

# Execute o comando
bin/cake migrations migrate

# Debug pausará nos breakpoints
```

### Logs

```bash
# Ver logs em tempo real
tail -f logs/cli-error.log
tail -f logs/error.log
tail -f logs/debug.log

# Ver últimas 50 linhas
tail -n 50 logs/error.log

# Buscar erro específico
grep "Error" logs/error.log
grep "Exception" logs/error.log

# Limpar logs
> logs/error.log
> logs/debug.log
```

### Debug.log no CakePHP

```php
// No código PHP
use Cake\Log\Log;

// Log simples
Log::debug('Valor da variável: ' . $variable);

// Log com contexto
Log::debug('Usuário logado', ['user_id' => $userId]);

// Log de array/objeto
Log::debug('Dados recebidos', ['data' => $requestData]);
```

---

## 🔧 Configuração

### Variáveis de Ambiente

```bash
# Ver variáveis
env | grep DATABASE

# Temporariamente alterar
export DEBUG=true

# Adicionar no .bashrc (permanente no container)
echo 'export MY_VAR=value' >> ~/.bashrc
```

### PHP.ini

```bash
# Ver configuração atual
php -i | grep memory_limit

# Ver arquivo php.ini
php --ini
```

### Composer

```bash
# Ver informações do projeto
composer info

# Ver pacote específico
composer show cakephp/cakephp

# Verificar atualizações disponíveis
composer outdated

# Diagnosticar problemas
composer diagnose
```

---

## 📝 Workflows Completos

### Workflow: Nova Feature de CRUD

```bash
# 1. Criar migration
bin/cake bake migration CreateProducts name:string price:decimal status:string

# 2. Executar migration
bin/cake migrations migrate

# 3. Criar model
bin/cake bake model Products

# 4. Criar controller
bin/cake bake controller Products

# 5. Criar templates
bin/cake bake template Products

# 6. Criar testes
bin/cake bake test Controller Products
bin/cake bake test Table Products

# 7. Executar testes
vendor/bin/phpunit tests/TestCase/Controller/ProductsControllerTest.php

# 8. Verificar código
vendor/bin/phpcs src/Controller/ProductsController.php
vendor/bin/phpstan analyse src/Controller/ProductsController.php

# 9. Limpar cache
bin/cake cache clear_all
```

### Workflow: Atualizar Dependências

```bash
# 1. Verificar atualizações
composer outdated

# 2. Atualizar composer.json (edite manualmente ou use require)
composer require cakephp/cakephp:^5.0

# 3. Atualizar dependências
composer update

# 4. Executar testes
vendor/bin/phpunit

# 5. Verificar código
vendor/bin/phpstan analyse src

# 6. Se tudo OK, commit
git add composer.json composer.lock
git commit -m "deps: atualiza CakePHP para 5.0"
```

### Workflow: Corrigir Bug em Produção

```bash
# 1. Criar branch hotfix
git checkout -b hotfix/critical-bug

# 2. Adicionar breakpoint no código suspeito
# (use VS Code para adicionar)

# 3. Iniciar debug (F5)

# 4. Reproduzir bug

# 5. Identificar causa

# 6. Corrigir código

# 7. Adicionar teste que reproduz o bug
# (crie teste que falha antes da correção)

# 8. Executar testes
vendor/bin/phpunit

# 9. Verificar qualidade
vendor/bin/phpcs src/
vendor/bin/phpstan analyse src/

# 10. Commit e push
git add .
git commit -m "fix: corrige bug crítico no cálculo"
git push origin hotfix/critical-bug
```

---

## 🎨 Produtividade

### Aliases Úteis

Adicione ao `~/.bashrc` (dentro do container):

```bash
# CakePHP
alias cake='bin/cake'
alias bake='bin/cake bake'
alias migrate='bin/cake migrations migrate'
alias rollback='bin/cake migrations rollback'
alias clear-cache='bin/cake cache clear_all'

# Testes
alias test='vendor/bin/phpunit'
alias test-coverage='vendor/bin/phpunit --coverage-html coverage/'

# Qualidade
alias stan='vendor/bin/phpstan analyse src'
alias cs='vendor/bin/phpcs src'
alias cbf='vendor/bin/phpcbf src'
alias quality='vendor/bin/phpcs src && vendor/bin/phpstan analyse src'

# Logs
alias error-log='tail -f logs/error.log'
alias debug-log='tail -f logs/debug.log'

# Recarregar aliases
source ~/.bashrc
```

Agora você pode usar:

```bash
cake routes
bake controller Users
migrate
test
stan
```

### Snippets de Código

Use no VS Code para acelerar desenvolvimento:

#### Controller Action

```php
/**
 * @return \Cake\Http\Response|null|void
 */
public function index()
{
    $items = $this->paginate($this->ModelName);
    $this->set(compact('items'));
}
```

#### Validation Rule

```php
->notEmptyString('field')
->requirePresence('field', 'create')
->maxLength('field', 255)
```

---

## 🚀 Otimização

### Limpar Tudo

```bash
# Script completo de limpeza
#!/bin/bash
bin/cake cache clear_all
rm -rf tmp/cache/models/*
rm -rf tmp/cache/persistent/*
rm -rf tmp/cache/views/*
rm -rf tmp/sessions/*
composer dump-autoload -o
echo "✅ Tudo limpo!"
```

### Rebuild do Container

```bash
# Parar containers
docker compose -f docker-compose.dev.yml down

# Rebuild
docker compose -f docker-compose.dev.yml build --no-cache

# Iniciar
docker compose -f docker-compose.dev.yml up -d
```

---

## 📚 Recursos Adicionais

- [CakePHP Cookbook](https://book.cakephp.org/5/en/index.html)
- [CakePHP API](https://api.cakephp.org/5.0/)
- [Awesome CakePHP](https://github.com/FriendsOfCake/awesome-cakephp)
- [CakePHP Questions](https://stackoverflow.com/questions/tagged/cakephp)

---

**💡 Dica**: Salve este arquivo nos seus favoritos para referência rápida!
