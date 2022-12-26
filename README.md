# Born2BeRoot <a href="https://github.com/JaeSeoKim/badge42"><img src="https://badge42.vercel.app/api/v2/cla88p9vf00110fmd8v1byjg9/project/2921681" alt="almatos's 42 ft_printf Score" /></a>

### Este projeto visa apresentá-lo ao maravilhoso mundo da virtualização, você criará sua primeira máquina no VirtualBox sob instruções específicas. 

### Então, ao final deste projeto, você poderá configurar seu próprio sistema operacional enquanto implementa regras estritas.

#
## Comandos para a avaliação - Grupos e Usuários:

-- Ver os grupos: cat /etc/group ou getent group (sudo,user42)

-- Criar um grupo: sudo addgroup nome_do_grupo

-- Deletar grupo: sudo delgroup nome_do_grupo

-- Criar um novo user: sudo adduser nome_do_user

-- Adicionar user no grupo: sudo adduser nome_do_user nome_do_grupo

-- Remover user do grupo: sudo deluser nome_do_user nome_do_grupo

-- Deletar user: sudo deluser nome_do_user

-- Alterar password: passwd nome_do_user (se nao se meter nome muda a pass do root)
#
## Comandos para a avaliação - Verificações e Modificações:


-- Ver particoes: lsblk

-- Ver que sudo esta instalado: sudo dpkg -s sudo

-- ver SSH status: sudo service ssh status

-- Ver qual o OS da maquina: uname -v (Debian)

-- Versão debian: cat /etc/os-release 

-- Ver se tem interface grafica: ls /usr/bin/*session 

-- Ver se o ufw esta em uso: sudo ufw status ou sudo service ufw status

-- Ver o hostname da maquina: hostname

-- Ver appArmor status: sudo aa-status

-- Ver ip e Mac: ip a

-- Ver agendamentos sem parar o crontab: sudo crontab -l

-- Ver se o UFW esta instalado e a funcionar corretamente: dpkg -s ufw || sudo ufw status numbered

-- Ver as regras de configuracao do sudo: sudo visudo

-- Ver criterios password (expirar): nano /etc/login.defs

-- Ver criterios password: nano /etc/pam.d/common-password 

-- Modifcar hostname: sudo vim /etc/hostname ou sudo vim /etc/hosts (necessario fazer reboot)

-- Faz stop dos agendamentos automaticos: sudo /etc/init.d/cron stop

-- Faz start dos agendamentos automaticos: sudo /etc/init.d/cron start

-- Editar agendamentos automaticos: sudo crontab -u root -e (modificar tempo ex:10 para 1)
#
## Outros Comandos Importantes:

-- Criar assinatura VM: sha1sum Born2beroot.vdi>signature.txt

-- Conectar a maquina virtual (root) atraves de ssh (terminal externo): ssh root@localhost -p 4242

-- Cria uma nova regra para a porta em questao: sudo ufw allow n_porta

-- Apaga uma nova regra para a porta em questao: sudo ufw delete n_porta

-- Configuracoes ssh: vin /etc/ssh/sshd_config || vin /etc/ssh/ssh_config

-- Restart sshd: systemctl restart sshd



