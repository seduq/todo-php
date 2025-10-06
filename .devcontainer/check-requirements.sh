#!/bin/bash

# 🎯 Quick Start Script for DevContainer
# Este script ajuda a verificar se tudo está pronto para usar o DevContainer

echo "🔍 Verificando requisitos do DevContainer..."
echo ""

# Verificar Docker
if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version)
    echo "✅ Docker encontrado: $DOCKER_VERSION"
else
    echo "❌ Docker não encontrado. Por favor, instale o Docker."
    echo "   https://docs.docker.com/get-docker/"
    exit 1
fi

# Verificar Docker Compose
if command -v docker compose &> /dev/null; then
    COMPOSE_VERSION=$(docker compose version)
    echo "✅ Docker Compose encontrado: $COMPOSE_VERSION"
else
    echo "❌ Docker Compose não encontrado. Por favor, instale o Docker Compose."
    echo "   https://docs.docker.com/compose/install/"
    exit 1
fi

# Verificar se Docker está rodando
if docker ps &> /dev/null; then
    echo "✅ Docker daemon está rodando"
else
    echo "❌ Docker daemon não está rodando. Por favor, inicie o Docker."
    exit 1
fi

# Verificar VS Code
if command -v code &> /dev/null; then
    echo "✅ VS Code encontrado"
else
    echo "⚠️  VS Code não encontrado no PATH"
    echo "   Para usar DevContainer, instale VS Code: https://code.visualstudio.com/"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 Tudo pronto para usar o DevContainer!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Próximos passos:"
echo ""
echo "1. Abra o projeto no VS Code:"
echo "   code ."
echo ""
echo "2. Instale a extensão 'Remote - Containers' se ainda não tiver:"
echo "   - Pressione Ctrl+Shift+X"
echo "   - Busque por 'Remote - Containers'"
echo "   - Clique em 'Install'"
echo ""
echo "3. Reabra no container:"
echo "   - Pressione F1 ou Ctrl+Shift+P"
echo "   - Digite: 'Dev Containers: Reopen in Container'"
echo "   - Pressione Enter"
echo ""
echo "4. Aguarde o build do container (primeira vez demora mais)"
echo ""
echo "5. Acesse a aplicação:"
echo "   - App: http://localhost:8080"
echo "   - PHPMyAdmin: http://localhost:8081"
echo ""
echo "📚 Documentação completa em: .devcontainer/README.md"
echo ""
