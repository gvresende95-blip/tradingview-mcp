# Instruções para Lançar TradingView MSIX com Debug Port

## Problema
Aplicativos instalados via Windows Store (MSIX) têm proteções que impedem o lançamento direto com argumentos de linha de comando via scripts.

## Solução Manual

### Opção 1: PowerShell com Privilégios de Administrador

1. Abra o PowerShell como Administrador
2. Execute o seguinte comando:

```powershell
Start-Process "C:\Program Files\WindowsApps\TradingView.Desktop_3.2.0.7916_x64__n534cwy3pjxzj\TradingView.exe" -ArgumentList "--remote-debugging-port=9222"
```

### Opção 2: Criar um Atalho Permanente

1. Crie um atalho na área de trabalho para:
   ```
   "C:\Program Files\WindowsApps\TradingView.Desktop_3.2.0.7916_x64__n534cwy3pjxzj\TradingView.exe"
   ```

2. Clique com o botão direito no atalho → Propriedades

3. No campo "Destino", adicione ao final:
   ```
   --remote-debugging-port=9222
   ```

4. Ficará assim:
   ```
   "C:\Program Files\WindowsApps\TradingView.Desktop_3.2.0.7916_x64__n534cwy3pjxzj\TradingView.exe" --remote-debugging-port=9222
   ```

5. Clique em OK e use esse atalho sempre que quiser usar com o MCP

### Opção 3: Usar o Registro do Windows (Avançado)

Adicionar uma entrada no registro para sempre iniciar com a porta de debug, mas isso requer conhecimento avançado do Windows.

## Verificar se Funcionou

Após lançar o TradingView com qualquer das opções acima, execute:

```bash
curl http://localhost:9222/json/version
```

Se retornar JSON com informações do Chrome DevTools Protocol, está funcionando!

## Próximos Passos

Depois de lançar o TradingView manualmente com `--remote-debugging-port=9222`, você pode verificar a conexão com:

```bash
node src/cli/index.js status
```

Ou se estiver usando o Claude Code, peça para ele executar `tv_health_check`.
