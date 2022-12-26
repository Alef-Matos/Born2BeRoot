# Project 4: Born2BeRoot   <a href="https://github.com/JaeSeoKim/badge42"><img src="https://badge42.vercel.app/api/v2/cla88p9vf00110fmd8v1byjg9/project/2921681" alt="almatos's 42 ft_printf Score" /></a>


## Índice

- [Introdução](#introdução)
- [Parte obrigatória](#parte-obrigatória)
- [Bonus](#parte-bonus)
- [Tarefas](#tarefas)

## Introdução

Este projeto visa apresentá-lo ao maravilhoso mundo da virtualização, você criará sua primeira máquina no VirtualBox sob instruções específicas. Então, ao final deste projeto, você poderá configurar seu próprio sistema operacional enquanto implementa regras estritas.

## Parte obrigatória
<div align="center">

</div>

### Born2BeRoot

- :ballot_box_with_check: Parte obrigatória: [Ver o Subject](https://github.com/Alef-Matos/Born2BeRoot/blob/main/Subject/subject.pdf).

### Parte bonus

<details open>
<summary> Bonus </summary>

- :ballot_box_with_check: Configurar as partições corretamente para obter uma estrutura semelhante à do subject.
- :white_large_square: Bonus PartConfigurar um site WordPress funcional com os seguintes serviços: lighttpd, Mari, aDB e PHP.
- :white_large_square: Bonus PartConfigurar um serviço de sua escolha que considere útil (NGINX / Apache2).

</details>

## Comandos para a avaliação

### Grupos e Usuários:
:arrow_right: Ver os grupos: cat /etc/group ou getent group (sudo,user42)

:arrow_right: Criar um grupo: sudo addgroup nome_do_grupo

:arrow_right: Deletar grupo: sudo delgroup nome_do_grupo

:arrow_right: Criar um novo user: sudo adduser nome_do_user

:arrow_right: Adicionar user no grupo: sudo adduser nome_do_user nome_do_grupo

:arrow_right: Remover user do grupo: sudo deluser nome_do_user nome_do_grupo

:arrow_right: Deletar user: sudo deluser nome_do_user

:arrow_right: Alterar password: passwd nome_do_user (se nao se meter nome muda a pass do root)

#

### Verificações e Modificações:

:arrow_right: Ver particoes: lsblk

:arrow_right: Ver que sudo esta instalado: sudo dpkg -s sudo

:arrow_right: ver SSH status: sudo service ssh status

:arrow_right: Ver qual o OS da maquina: uname -v (Debian)

:arrow_right: Versão debian: cat /etc/os-release 

:arrow_right: Ver se tem interface grafica: ls /usr/bin/*session 

:arrow_right: Ver se o ufw esta em uso: sudo ufw status ou sudo service ufw status

:arrow_right: Ver o hostname da maquina: hostname

:arrow_right: Ver appArmor status: sudo aa-status

:arrow_right: Ver ip e Mac: ip a

:arrow_right: Ver agendamentos sem parar o crontab: sudo crontab -l

:arrow_right: Ver se o UFW esta instalado e a funcionar corretamente: dpkg -s ufw || sudo ufw status numbered

:arrow_right: Ver as regras de configuracao do sudo: sudo visudo

:arrow_right: Ver criterios password (expirar): nano /etc/login.defs

:arrow_right: Ver criterios password: nano /etc/pam.d/common-password 

:arrow_right: Modifcar hostname: sudo vim /etc/hostname ou sudo vim /etc/hosts (necessario fazer reboot)

:arrow_right: Faz stop dos agendamentos automaticos: sudo /etc/init.d/cron stop

:arrow_right: Faz start dos agendamentos automaticos: sudo /etc/init.d/cron start

:arrow_right: Editar agendamentos automaticos: sudo crontab -u root -e (modificar tempo ex:10 para 1)

### Outros Comandos Importantes:

:arrow_right: Criar assinatura VM: sha1sum Born2beroot.vdi>signature.txt

:arrow_right: Conectar a maquina virtual (root) atraves de ssh (terminal externo): ssh root@localhost -p 4242

:arrow_right: Cria uma nova regra para a porta em questao: sudo ufw allow n_porta

:arrow_right: Apaga uma nova regra para a porta em questao: sudo ufw delete n_porta

:arrow_right: Configuracoes ssh: vin /etc/ssh/sshd_config || vin /etc/ssh/ssh_config

:arrow_right: Restart sshd: systemctl restart sshd