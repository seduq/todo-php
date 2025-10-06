# 📚 DevContainer - Índice de Documentação

Bem-vindo à documentação do DevContainer para o projeto Todo PHP (CakePHP)!

## 🗂️ Estrutura da Documentação

Este diretório contém toda a documentação necessária para usar e entender o DevContainer.

### 📄 Arquivos de Configuração

| Arquivo                 | Descrição                              |
| ----------------------- | -------------------------------------- |
| `devcontainer.json`     | Configuração principal do DevContainer |
| `check-requirements.sh` | Script para verificar pré-requisitos   |

### 📖 Documentação

| Arquivo                                  | Descrição                                    | Para Quem?        |
| ---------------------------------------- | -------------------------------------------- | ----------------- |
| **[README.md](README.md)**               | Documentação principal e referência completa | Todos             |
| **[VISUAL_GUIDE.md](VISUAL_GUIDE.md)**   | Guia visual passo a passo                    | Iniciantes        |
| **[EXAMPLES.md](EXAMPLES.md)**           | Exemplos práticos e workflows                | Desenvolvedores   |
| **[SETUP_SUMMARY.md](SETUP_SUMMARY.md)** | Resumo técnico das alterações                | DevOps/Arquitetos |
| **[INDEX.md](INDEX.md)**                 | Este arquivo - índice geral                  | Todos             |

---

## 🎯 Por Onde Começar?

### Sou Novo no Projeto

1. ✅ Leia **[README.md](README.md)** - Visão geral
2. ✅ Execute `./check-requirements.sh` - Verifique seu ambiente
3. ✅ Siga **[VISUAL_GUIDE.md](VISUAL_GUIDE.md)** - Guia passo a passo
4. ✅ Explore **[EXAMPLES.md](EXAMPLES.md)** - Exemplos práticos

### Sou Desenvolvedor Experiente

1. ✅ Leia **[README.md](README.md)** - Configurações e comandos
2. ✅ Consulte **[EXAMPLES.md](EXAMPLES.md)** - Workflows e snippets
3. ✅ Comece a codar!

### Sou DevOps/Arquiteto

1. ✅ Leia **[SETUP_SUMMARY.md](SETUP_SUMMARY.md)** - Alterações técnicas
2. ✅ Revise `devcontainer.json` - Configurações
3. ✅ Verifique `../docker-compose.dev.yml` - Ajustes no compose

---

## 📋 Conteúdo de Cada Arquivo

### 1. README.md

**O que contém:**

- Instruções de uso
- Comandos úteis (CakePHP, Composer, Testes)
- Configurações do banco de dados
- Debug com Xdebug
- Volumes persistentes
- Troubleshooting
- Referências

**Quando usar:**

- Referência rápida de comandos
- Configurações do ambiente
- Resolver problemas comuns

---

### 2. VISUAL_GUIDE.md

**O que contém:**

- Passo a passo com detalhes visuais
- Verificação de pré-requisitos
- Como abrir o projeto
- Construção do container
- Acesso à aplicação
- Configuração de debug
- Tasks do VS Code
- Extensões instaladas
- Workflows comuns
- Troubleshooting visual

**Quando usar:**

- Primeira vez usando DevContainer
- Quer entender cada etapa
- Precisa de ajuda visual
- Onboarding de novos membros

---

### 3. EXAMPLES.md

**O que contém:**

- Exemplos práticos prontos para usar
- Comandos Composer
- Comandos CakePHP (bake, migrations, etc)
- Execução de testes
- Análise de código (PHPStan, PHPCS)
- Comandos MySQL
- Debug com Xdebug
- Logs
- Workflows completos
- Aliases para produtividade
- Scripts de otimização

**Quando usar:**

- Precisa de um comando específico
- Quer copiar e colar exemplos
- Implementar workflows completos
- Aprender boas práticas

---

### 4. SETUP_SUMMARY.md

**O que contém:**

- Lista de arquivos criados
- Lista de arquivos modificados
- Explicação das alterações
- Funcionalidades implementadas
- Estrutura final do projeto
- Benefícios da implementação
- Notas técnicas

**Quando usar:**

- Entender o que foi alterado
- Documentar mudanças para o time
- Review de código
- Auditoria de configuração

---

### 5. INDEX.md (este arquivo)

**O que contém:**

- Índice geral da documentação
- Guia de navegação
- Quick reference
- FAQ

**Quando usar:**

- Não sabe por onde começar
- Procura documentação específica
- Quer visão geral do projeto

---

## ⚡ Quick Reference

### Comandos Mais Usados

```bash
# CakePHP
bin/cake routes                    # Ver rotas
bin/cake cache clear_all          # Limpar cache
bin/cake migrations migrate       # Executar migrations
bin/cake bake controller Nome     # Criar controller

# Composer
composer install                  # Instalar dependências
composer require vendor/package   # Adicionar pacote

# Testes
vendor/bin/phpunit               # Executar testes

# Qualidade
vendor/bin/phpstan analyse src   # Análise estática
vendor/bin/phpcs src             # Verificar code style
vendor/bin/phpcbf src            # Corrigir code style

# Logs
tail -f logs/error.log           # Ver logs em tempo real

# Permissões
chmod -R 777 logs tmp            # Corrigir permissões
```

### Acessos Rápidos

| Serviço        | URL                   | Credenciais                           |
| -------------- | --------------------- | ------------------------------------- |
| **Aplicação**  | http://localhost:8080 | -                                     |
| **PHPMyAdmin** | http://localhost:8081 | user: root, pass: root_password       |
| **MySQL**      | localhost:3306        | user: todoapp, pass: todoapp_password |

### VS Code - Atalhos

| Atalho         | Ação              |
| -------------- | ----------------- |
| `F5`           | Iniciar debug     |
| `F9`           | Toggle breakpoint |
| `Ctrl+Shift+P` | Command palette   |
| `` Ctrl+` ``   | Toggle terminal   |
| `Ctrl+Shift+B` | Run build task    |

---

## ❓ FAQ - Perguntas Frequentes

### Como abrir o projeto no DevContainer?

```bash
code .
# Então: F1 → "Dev Containers: Reopen in Container"
```

### Como parar os containers?

```bash
docker compose -f docker-compose.dev.yml down
```

### Como resetar tudo?

```bash
docker compose -f docker-compose.dev.yml down -v
# F1 → "Dev Containers: Rebuild Container"
```

### Como ver logs do container?

```bash
# Dentro do container
tail -f logs/error.log

# Fora do container
docker compose -f docker-compose.dev.yml logs -f
```

### Como executar comandos sem abrir o container?

```bash
docker exec -it todoapp_php_dev bin/cake routes
docker exec -it todoapp_php_dev composer install
```

### Como conectar ao banco de dados?

```bash
# De dentro do container
mysql -h mysql -u todoapp -p

# De fora (ferramentas externas)
# Host: localhost
# Port: 3306
# User: todoapp
# Pass: todoapp_password
```

### Como adicionar uma extensão do VS Code?

Edite `.devcontainer/devcontainer.json` e adicione na lista de extensões:

```json
"extensions": [
  "seu.extensao-aqui"
]
```

Depois: `F1` → `Dev Containers: Rebuild Container`

### Como mudar versão do PHP?

1. Edite `docker/php/Dockerfile.dev`: `FROM php:8.3-fpm`
2. Edite `.devcontainer/devcontainer.json`: `phpVersion: "8.3.0"`
3. Reconstrua: `F1` → `Dev Containers: Rebuild Container`

### Como adicionar novo serviço (Redis, etc)?

1. Adicione no `docker-compose.dev.yml`
2. Adicione port forwarding em `.devcontainer/devcontainer.json`
3. Reconstrua o container

---

## 🔗 Links Úteis

### Projeto

- [README Principal](../README.md)
- [Docker Compose Dev](../docker-compose.dev.yml)
- [Dockerfile Dev](../docker/php/Dockerfile.dev)

### Documentação Externa

- [VS Code DevContainers](https://code.visualstudio.com/docs/devcontainers/containers)
- [CakePHP Documentation](https://book.cakephp.org/5/en/index.html)
- [Docker Documentation](https://docs.docker.com/)
- [PHP Documentation](https://www.php.net/docs.php)

### Ferramentas

- [Composer](https://getcomposer.org/doc/)
- [PHPUnit](https://phpunit.de/documentation.html)
- [PHPStan](https://phpstan.org/user-guide/getting-started)
- [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer/wiki)

---

## 📞 Suporte

### Problemas com DevContainer

1. Consulte a seção Troubleshooting em **[README.md](README.md)**
2. Veja problemas comuns em **[VISUAL_GUIDE.md](VISUAL_GUIDE.md)**
3. Execute `./check-requirements.sh` para diagnóstico

### Problemas com CakePHP

1. Consulte **[EXAMPLES.md](EXAMPLES.md)** para exemplos
2. Veja [CakePHP Documentation](https://book.cakephp.org/)
3. Stack Overflow: [cakephp tag](https://stackoverflow.com/questions/tagged/cakephp)

### Problemas com Docker

1. Verifique logs: `docker compose logs`
2. Consulte [Docker Documentation](https://docs.docker.com/)

---

## 🎯 Checklist de Setup

Use esta checklist na primeira vez:

- [ ] Docker instalado e rodando
- [ ] VS Code instalado
- [ ] Extensão Remote - Containers instalada
- [ ] Projeto clonado
- [ ] Executado `./check-requirements.sh`
- [ ] Projeto aberto no VS Code
- [ ] Container construído com sucesso
- [ ] Aplicação acessível em http://localhost:8080
- [ ] PHPMyAdmin acessível em http://localhost:8081
- [ ] Debug funcionando (testar breakpoint)
- [ ] Testes executando (`vendor/bin/phpunit`)
- [ ] Lido README.md principal

---

## 🎓 Recursos de Aprendizado

### Para Iniciantes

1. **[VISUAL_GUIDE.md](VISUAL_GUIDE.md)** - Aprenda passo a passo
2. **[EXAMPLES.md](EXAMPLES.md)** - Veja exemplos práticos
3. [CakePHP Cookbook](https://book.cakephp.org/) - Aprenda CakePHP

### Para Intermediários

1. **[README.md](README.md)** - Referência completa
2. **[EXAMPLES.md](EXAMPLES.md)** - Workflows avançados
3. Explore o código fonte em `app/src/`

### Para Avançados

1. **[SETUP_SUMMARY.md](SETUP_SUMMARY.md)** - Arquitetura
2. Customize `devcontainer.json`
3. Otimize `docker-compose.dev.yml`

---

## 📊 Estatísticas do Projeto

- **Arquivos de Configuração**: 4
- **Arquivos de Documentação**: 5
- **Extensões VS Code**: 10+
- **Tasks Predefinidas**: 9
- **Serviços Docker**: 4 (PHP, Nginx, MySQL, PHPMyAdmin)
- **Portas Expostas**: 3 (8080, 8081, 3306)

---

## 🌟 Contribuindo

Se você melhorar a documentação ou configuração:

1. Atualize os arquivos relevantes
2. Atualize este INDEX.md se necessário
3. Faça commit com mensagem descritiva
4. Compartilhe com o time!

---

**Última atualização:** 06 de Outubro de 2025  
**Versão:** 1.0.0  
**Mantenedor:** Equipe de Desenvolvimento

---

## 🎉 Conclusão

Você agora tem acesso a:

- ✅ Configuração completa do DevContainer
- ✅ Documentação abrangente
- ✅ Exemplos práticos
- ✅ Guias passo a passo
- ✅ Troubleshooting

**Escolha o documento mais adequado ao seu nível e comece a desenvolver!**

Happy Coding! 🚀
