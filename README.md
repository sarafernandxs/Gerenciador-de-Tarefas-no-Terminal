# todo.sh – Gerenciador de Tarefas no Terminal

![Shell Script](https://img.shields.io/badge/Bash-Script-green?style=flat\&logo=gnubash)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)

Um script **Bash** simples e sem dependências externas que permite criar, listar, concluir, remover e pesquisar tarefas diretamente no terminal. Ótimo para quem prefere soluções minimalistas, versionáveis e portáteis.

---

## ✨ Recursos

* **Adicionar tarefas** com opção de prioridade.
* **Listar** todas as tarefas com numeração automática.
* **Marcar/Desmarcar** tarefas como concluídas.
* **Deletar** tarefas definitivamente.
* **Pesquisar** tarefas por termo.
* Armazena tudo em um único arquivo: `~/.todo.txt`.
* Mensagens coloridas de feedback (verde para sucesso).

---

## ⚙️ Requisitos

* Bash 4 ou superior (presente na maioria das distribuições Linux e no macOS).
* Utilitário‑padrão `date` (GNU coreutils).

---

## 🛠️ Instalação

1. **Clone** ou copie este repositório:

```bash
git clone https://github.com/sarafernandxs/todo.sh.git
cd todo.sh
```

2. **Conceda permissão de execução**:

```bash
chmod +x todo.sh
```

3. (Opcional) **Disponibilize globalmente** movendo para um diretório do `PATH`:

```bash
sudo mv todo.sh /usr/local/bin/todo
```

Agora você pode chamar o script com `todo` de qualquer lugar.

---

## 🚀 Uso Rápido

```bash
# Adicionar uma tarefa de prioridade ALTA
todo add "Estudar estruturas de dados" ALTA

# Listar todas as tarefas
todo list

# Marcar a tarefa 2 como concluída
todo done 2

# Deletar a tarefa 3
todo del 3

# Pesquisar por "academia"
todo search academia
```

---

## 📖 Referência de Comandos

| Comando                     | Descrição                                                                             | Exemplo                                   |
| --------------------------- | ------------------------------------------------------------------------------------- | ----------------------------------------- |
| `add "TAREFA" [PRIORIDADE]` | Adiciona uma nova tarefa. O campo de prioridade é opcional (ex.: ALTA, MEDIA, BAIXA). | `todo add "Ler artigo sobre redes" MEDIA` |
| `list`                      | Lista todas as tarefas numeradas.                                                     | `todo list`                               |
| `done NUM`                  | Marca/desmarca a tarefa `NUM` como concluída.                                         | `todo done 4`                             |
| `del NUM`                   | Remove permanentemente a tarefa `NUM`.                                                | `todo del 7`                              |
| `search TERMO`              | Exibe tarefas que contenham `TERMO`.                                                  | `todo search python`                      |

> **Dica:** As prioridades são convertidas para maiúsculas automaticamente.

---

## 🗂️ Formato do Arquivo `~/.todo.txt`

Cada linha segue o padrão:

```
[]|AAAA‑MM‑DD|PRIORIDADE|DESCRIÇÃO DA TAREFA
```

* `[]` ou `[x]` indica **pendente** ou **concluída**.
* A data é gerada automaticamente no momento da criação.
* A prioridade é convertida para maiúsculas.

Exemplo:

```
[]|2025‑07‑02|ALTA|Estudar Bash scripting
[x]|2025‑07‑01|MEDIA|Ir para a academia
```

---

## 🎨 Personalização

* **Cores:** Edite as variáveis `GREEN` e `NC` no início do script para alterar o esquema de cores.
* **Local do arquivo de tarefas:** Modifique a variável `ARQUIVO_TODO` se preferir outro caminho/arquivo.

