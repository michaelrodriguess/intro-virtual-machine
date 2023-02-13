<h1 align="center">Intro Virtual Machine</h1>

<h2 class="code-line" data-line-start=1 data-line-end=2 ><a id="_Maravilhoso_mundo_da_Virtualizao__1"></a><em>Maravilhoso mundo da Virtualização</em></h2>
<p class="has-line-data" data-line-start="2" data-line-end="3">Nesse projeto eu tive que criar a minha primeira máquina virtual utilizando o VirtualBox sob instruções específicas. Depois, no final deste projeto, será possível criar o meu próprio sistema operacional aplicando regras estritas.</p>
<h2 class="code-line" data-line-start=4 data-line-end=5 ><a id="_Skills_e_Tecnologias_usadas_4"></a>✨ Skills e Tecnologias usadas✨</h2>
<ul>
<li class="has-line-data" data-line-start="5" data-line-end="6">Sistema Operacional/Unix</li>
<li class="has-line-data" data-line-start="6" data-line-end="7">Maquina Virtual (Oracle VM VirtualBox)</li>
<li class="has-line-data" data-line-start="7" data-line-end="8">Segurança de Sistemas Operacionais</li>
<li class="has-line-data" data-line-start="8" data-line-end="9">Bash Script</li>
<li class="has-line-data" data-line-start="9" data-line-end="10">PHP</li>
<li class="has-line-data" data-line-start="10" data-line-end="11">MariaDB</li>
<li class="has-line-data" data-line-start="11" data-line-end="12">Lighttpd</li>
<li class="has-line-data" data-line-start="12" data-line-end="14">FTP</li>
</ul>
<h1 class="code-line" data-line-start=14 data-line-end=15 ><a id="Instalaes_14"></a>Instalações</h1>
<ul>
<li class="has-line-data" data-line-start="15" data-line-end="16">
<h5 class="code-line" data-line-start=15 data-line-end=16 ><a id="Sistema_Operacional_15"></a>Sistema Operacional</h5>
</li>
</ul>
<p class="has-line-data" data-line-start="16" data-line-end="17">Optei pela instalação do Debian que é uma distrubuição dos Sistemas Unix, como primeiro passo devemos criar uma nova maquina virtual e setar para dar Boot usando a imagem ISO do Debian.</p>
<p class="has-line-data" data-line-start="19" data-line-end="27">Preset do Sistema<br>
→ Config Lingaguem do Sistema.<br>
→ Config Localização para determinar a hora BR.<br>
→ Config Teclado en_US.UTF-8.<br>
→ Config Hostname para o sistema. (microdri42).<br>
→ Config Senha do Hostname.<br>
→ Config Username para um usuario. (microdri).<br>
→ Config Senha do Username.</p>
<p class="has-line-data" data-line-start="28" data-line-end="37">Preset do Armazenamento do Sistema<br>
→ Config Particionamento de Disco como Manual para usar um modo diferente do esquema padrao.<br>
→ Crie Particao Primaria com 500MB para Boot do sistema.<br>
→ Indique o ponto de montagem da particao primaria para o /boot.<br>
→ Config Volumes Encriptados.<br>
→ Crie Grupos de Volumes. Determine o nome dos Grupos de Volumes (LVMGroup).<br>
→ Crie os Volumes Logicos no Grupo de Volumes.<br>
→ Set os volumes Logicos com o tipo de sistema de arquivo EXT4. Exceto o Swap, set o Swap para o sistema de arquivo Swap Area.<br>
→ Set os Pontos de montagens de cada Volume Logico. Para o Var-Log set o ponto de montagem manual <strong>var/log</strong>.</p>
<p class="has-line-data" data-line-start="38" data-line-end="43">Preset final da instalção do SO:<br>
→ Set de qual localidade voce quer baixar o gerenciador de pacote do Sistema Operational. (BR, <a href="http://deb.debian.org">deb.debian.org</a>).<br>
→ Set que NÃO venha instalado nenhum pacote além do pacote padrão do Debian.<br>
→ Set que SIM para a instalacao do GRUB boot loader.<br>
→ Set  que o GRUB  inicialize usando o Debian que está na partição primária.</p>
<ul>
<li class="has-line-data" data-line-start="44" data-line-end="45">
<h5 class="code-line" data-line-start=44 data-line-end=45 ><a id="Sudo_44"></a>Sudo</h5>
</li>
</ul>
<p class="has-line-data" data-line-start="45" data-line-end="46">O comando sudo do sistema operacional Unix permite a usuários comuns obter privilégios de outro usuário, em geral o super usuário, para executar tarefas específicas dentro do sistema de maneira segura e controlável pelo administrador.</p>
<p class="has-line-data" data-line-start="48" data-line-end="49">→ Baixando o pacote do comando sudo</p>
<pre><code class="has-line-data" data-line-start="50" data-line-end="52" class="language-bash"> apt-get install sudo
</code></pre>
<p class="has-line-data" data-line-start="53" data-line-end="54">→ adicionando o sudo ao grupo do meu usuário microdri</p>
<pre><code class="has-line-data" data-line-start="55" data-line-end="57" class="language-sh">adduser microdri sudo
</code></pre>
<p class="has-line-data" data-line-start="58" data-line-end="59">Adicionando Regras Estritas ao grupo SUDO 🔐</p>
<p class="has-line-data" data-line-start="60" data-line-end="62">→ Adicionando uma mensagem personalizada que seja exibida se ocorrer um erro devido a uma palavra-passe errada ao utilizar o sudo.<br>
No arquivo /etc/sudoers ou sudo visudo adicionar aos Defaults a seguinte regra:</p>
<pre><code class="has-line-data" data-line-start="63" data-line-end="65" class="language-sh">Defaults    badpass_message=<span class="hljs-string">"Mensagem para usuario que errar a senha"</span>
</code></pre>
<p class="has-line-data" data-line-start="66" data-line-end="67">→ Adicionando um  Diretório e Arquivo para receber cada ação utilizando sudo, tanto entradas como saídas. O Arquivo de registo tem de ser guardado na pasta /var/log/sudo/.</p>
<blockquote>
<p class="has-line-data" data-line-start="67" data-line-end="69">Step 1 → criar diretorio sudo dentro do diretorio /var/log/.<br>
Step 2 → criar aquivo sudo.log dentro do diretorio /var/log/sudo/.</p>
</blockquote>
<p class="has-line-data" data-line-start="70" data-line-end="72">→ Configurando para que os Logs de input e output usos do comando sudo tem que ir para o arquivo /var/log/sudo/sudo.log.<br>
No arquivo /etc/sudoers ou sudo visudo adicionar aos Defaults a seguinte regra:</p>
<pre><code class="has-line-data" data-line-start="74" data-line-end="76" class="language-sh">Defaults    logfile=<span class="hljs-string">"/var/log/sudo/sudo.log"</span>
</code></pre>
<pre><code class="has-line-data" data-line-start="77" data-line-end="79" class="language-sh">Defaults    <span class="hljs-built_in">log</span>_input,<span class="hljs-built_in">log</span>_output
</code></pre>
<pre><code class="has-line-data" data-line-start="80" data-line-end="82" class="language-sh">Defaults    iolog_dir=<span class="hljs-string">"PATH"</span>
</code></pre>
<p class="has-line-data" data-line-start="82" data-line-end="84">→ Ativando modo TTY.<br>
No arquivo /etc/sudoers ou sudo visudo adicionar aos Defaults a seguinte regra:</p>
<pre><code class="has-line-data" data-line-start="85" data-line-end="87" class="language-sh">Defaults  requiretty
</code></pre>
<ul>
<li class="has-line-data" data-line-start="88" data-line-end="90">
<h5 class="code-line" data-line-start=88 data-line-end=89 ><a id="SSH_88"></a>SSH</h5>
</li>
</ul>
<p class="has-line-data" data-line-start="90" data-line-end="91">SSH é a sigla para Secure Socket Shell, sendo um dos protocolos específicos de segurança de troca de arquivos entre cliente e servidor de internet, usando criptografia. O objetivo do SSH é permitir que desenvolvedores ou outros usuários realizem alterações em sites e servidores utilizando uma conexão simples e segura.</p>
<p class="has-line-data" data-line-start="92" data-line-end="93">→  Baixando pacote do SSH</p>
<pre><code class="has-line-data" data-line-start="94" data-line-end="96" class="language-sh"> apt-get install ssh
</code></pre>
<p class="has-line-data" data-line-start="96" data-line-end="99">→ Alterando configurações do SSH<br>
No seguinte Diretório /etc/ssh/sshd_config alterar:<br>
Porta padrão SSH para 4242.</p>
<pre><code class="has-line-data" data-line-start="100" data-line-end="102" class="language-sh"> Port <span class="hljs-number">4242</span>
</code></pre>
<p class="has-line-data" data-line-start="102" data-line-end="103">Descomentar a permissão</p>
<pre><code class="has-line-data" data-line-start="104" data-line-end="106" class="language-sh"> PermitRootLogin no
</code></pre>
<p class="has-line-data" data-line-start="106" data-line-end="107">💡 para acessar minha maquina vitual via ssh, basta entrar no terminal de outro pc e digitar:</p>
<pre><code class="has-line-data" data-line-start="108" data-line-end="111" class="language-sh">ssh -p <span class="hljs-number">4242</span> &lt;usuario&gt;@localhost e digitar a senha
ssh -p <span class="hljs-number">4242</span> &lt;usuario&gt;@ip-da-maquina (para ver o ip da maquina, basta ver com o hostname -I)
</code></pre>
<ul>
<li class="has-line-data" data-line-start="112" data-line-end="113">
<h5 class="code-line" data-line-start=112 data-line-end=113 ><a id="UFW_112"></a>UFW</h5>
</li>
</ul>
<p class="has-line-data" data-line-start="113" data-line-end="114">O UFW, ou Uncomplicated Firewall, é gerenciador simplificado de firewall que esconde a complexidade das tecnologias de filtragem de pacotes de baixo nível, como <strong>iptables</strong> e <strong>nftables</strong>.</p>
<p class="has-line-data" data-line-start="115" data-line-end="116">→  Baixando pacote do SSH</p>
<pre><code class="has-line-data" data-line-start="117" data-line-end="119" class="language-sh">apt-get install ufw
</code></pre>
<p class="has-line-data" data-line-start="119" data-line-end="120">→  Ativando o UFW</p>
<pre><code class="has-line-data" data-line-start="121" data-line-end="123" class="language-sh">sudo ufw <span class="hljs-built_in">enable</span>
</code></pre>
<p class="has-line-data" data-line-start="123" data-line-end="124">→  Verificando se  o UFW  está ativado e funcionando</p>
<pre><code class="has-line-data" data-line-start="125" data-line-end="127" class="language-sh">sudo ufw status
</code></pre>
<p class="has-line-data" data-line-start="127" data-line-end="128">→  Abrindo a porta  o SSH  com o UFW</p>
<pre><code class="has-line-data" data-line-start="129" data-line-end="131" class="language-sh">sudo ufw allow <span class="hljs-number">4242</span>.
</code></pre>
<ul>
<li class="has-line-data" data-line-start="131" data-line-end="132">
<h5 class="code-line" data-line-start=131 data-line-end=132 ><a id="Polticas_de_Privacidade_131"></a>Políticas de Privacidade</h5>
</li>
</ul>
<p class="has-line-data" data-line-start="132" data-line-end="133">Política de privacidade é um conjunto de termos que descreve as práticas adotadas pelo Usuário ou Aplicação em relação às informações. Sua função é esclarecer ao visitante como os dados serão utilizados e qual finalidade.</p>
<p class="has-line-data" data-line-start="134" data-line-end="135">→  Baixando o pacote  da Biblioteca de Segurança  <strong>libpam-cracklib</strong></p>
<pre><code class="has-line-data" data-line-start="136" data-line-end="138" class="language-sh">sudo apt install libpam-cracklib
</code></pre>
<p class="has-line-data" data-line-start="138" data-line-end="141">Alterarando as politicas de senha usando a biblioteca cracklib.<br>
→  Adicionando Regra para que a senha seja resetada a cada 30 dias.<br>
No arquivo /etc/login.defs alterar:</p>
<pre><code class="has-line-data" data-line-start="142" data-line-end="144" class="language-sh">PASS_MAX_DAYS <span class="hljs-number">30</span>
</code></pre>
<p class="has-line-data" data-line-start="144" data-line-end="146">→  Adicionando Regra para que o numero de dias mínimos que o usuário pode alterar a senha novamente seja de 2 dias.<br>
No arquivo /etc/login.defs alterar:</p>
<pre><code class="has-line-data" data-line-start="147" data-line-end="149" class="language-sh">PASS_MIN_DAYS <span class="hljs-number">2</span>
</code></pre>
<p class="has-line-data" data-line-start="149" data-line-end="151">→  Adicionando Regra para que o usuario receber uma mensagem de aviso 7 dias antes da sua palavra-passe expirar?<br>
No arquivo /etc/login.defs alterar:</p>
<pre><code class="has-line-data" data-line-start="152" data-line-end="154" class="language-sh">PASS_WARN_AGE <span class="hljs-number">7</span>
</code></pre>
<p class="has-line-data" data-line-start="154" data-line-end="156">→  Adicionando Regra para que a palavra-chave tenha pelo menos 10 caracteres.<br>
No arquivo /etc/pam.d/common.password alterar :</p>
<pre><code class="has-line-data" data-line-start="157" data-line-end="159" class="language-sh">pam.cracklib.so minlen=<span class="hljs-number">10</span>
</code></pre>
<p class="has-line-data" data-line-start="159" data-line-end="161">→  Adicionando Regra para que a palavra-chave tenha uma letra maiuscula e um numero.<br>
No arquivo /etc/pam.d/common.password alterar :</p>
<pre><code class="has-line-data" data-line-start="162" data-line-end="165" class="language-sh">pam.cracklib.so ucredit=-<span class="hljs-number">1</span>
pam.cracklib.so dcredit=-<span class="hljs-number">1</span>
</code></pre>
<p class="has-line-data" data-line-start="165" data-line-end="167">→  Adicionando Regra para que palavra-chave nao tenha 3 caracteres iguais consecutivos.<br>
No arquivo /etc/pam.d/common.password alterar :</p>
<pre><code class="has-line-data" data-line-start="168" data-line-end="170" class="language-sh">pam.cracklib.so maxrepeat=<span class="hljs-number">3</span>
</code></pre>
<p class="has-line-data" data-line-start="170" data-line-end="172">→  Adicionando Regra para que a palavra-passe não possa ser o nome do usuario.<br>
No arquivo /etc/login.defs alterar:</p>
<pre><code class="has-line-data" data-line-start="173" data-line-end="175" class="language-sh">pam.cracklib.so reject_username
</code></pre>
<p class="has-line-data" data-line-start="175" data-line-end="177">→  Adicionando Regra para que a palavra-chave deve ter pelo menos 7 caracteres que não façam parte da senha anterior.<br>
No arquivo /etc/login.defs alterar:</p>
<pre><code class="has-line-data" data-line-start="178" data-line-end="180" class="language-sh">pam.cracklib.so difok=<span class="hljs-number">7</span>
</code></pre>
<p class="has-line-data" data-line-start="180" data-line-end="182">→  Adicionando Regra para que as regras alteradas acima seja aplicada para o ROOT.<br>
No arquivo /etc/login.defs alterar:</p>
<pre><code class="has-line-data" data-line-start="183" data-line-end="185" class="language-sh">pam.cracklib.so enforce_<span class="hljs-keyword">for</span>_root
</code></pre>
<h1 class="code-line" data-line-start=186 data-line-end=187 ><a id="Script_186"></a>Script</h1>
<p class="has-line-data" data-line-start="187" data-line-end="188">É preciso criar um Script, que deve ser desenvolvido em bash.Esse Script terá que exibir para todos usuários do Sistema algumas informações (listada abaixo) do Sistema a cada 10 minutos.</p>
<ul>
<li class="has-line-data" data-line-start="189" data-line-end="190">Arquitetura do Kernel do Linux e a versão do Sistema Operacional</li>
<li class="has-line-data" data-line-start="190" data-line-end="191">Número de processadores físicos</li>
<li class="has-line-data" data-line-start="191" data-line-end="192">Número de processadores virtuais</li>
<li class="has-line-data" data-line-start="192" data-line-end="193">Tamanho total de RAM, tamanho de RAM usada em meu servidor e a taxa de utilização como percentagem</li>
<li class="has-line-data" data-line-start="193" data-line-end="194">Tamanho Total de memoria no meu servidor(PC), Tamanho usado e a sua taxa de utilização como percentagem</li>
<li class="has-line-data" data-line-start="194" data-line-end="195">Taxa de utilização dos meus processadores e printar na tela no formatado como percentagem</li>
<li class="has-line-data" data-line-start="195" data-line-end="196">Data e hora da última reinicialização</li>
<li class="has-line-data" data-line-start="196" data-line-end="197">Verificar se estou a usar LVM</li>
<li class="has-line-data" data-line-start="197" data-line-end="198">Verificar quantas conexão TCP estão abertas</li>
<li class="has-line-data" data-line-start="198" data-line-end="199">Pegar  o endereço de IPV4 e o endereço MAC do Pc</li>
<li class="has-line-data" data-line-start="199" data-line-end="200">Pegar o número de comandos executados com o programa SUDO</li>
<li class="has-line-data" data-line-start="200" data-line-end="202">Agendar tarefas(com o Cron)</li>
</ul>
<hr>
<h1 class="code-line" data-line-start=204 data-line-end=205 ><a id="Projeto_Bnus_204"></a>Projeto Bônus</h1>
<p class="has-line-data" data-line-start="205" data-line-end="206">O Objetivo da parte bônus deste projeto é introduzir um pouco do conceito de serviços Web e Banco de dados, fui capaz de criar um Site com WordPress usando Lighttpd, MariaDB, e PHP. Como serviço Web adicionais optei por aprender e utilizar o FTP.</p>
<p class="has-line-data" data-line-start="207" data-line-end="208">→  Baixando e  inicializando o serviço Lighttpd</p>
<pre><code class="has-line-data" data-line-start="209" data-line-end="215" class="language-sh">sudo apt install lighttpd
sudo systemctl status lighttpd
- Caso não esteja ativado rodar o seguinte comando:
sudo systemctl start lighttpd
sudo systemctl <span class="hljs-built_in">enable</span> lighttpd
</code></pre>
<p class="has-line-data" data-line-start="216" data-line-end="217">→  Baixando, criando e configurando o Banco de Dados MariaDB</p>
<pre><code class="has-line-data" data-line-start="218" data-line-end="224" class="language-sh">sudo apt install mariadb-server
sudo mariadb
create database &lt;nomedoDB&gt;;
GRANT ALL ON *.* TO <span class="hljs-string">'admin'</span>@<span class="hljs-string">'localhost'</span> IDENTIFIED BY <span class="hljs-string">'password'</span> WITH GRANT OPTION;
FLUSH PRIVILEGES;
</code></pre>
<p class="has-line-data" data-line-start="224" data-line-end="225">→  Baixando e configurando o PHP</p>
<pre><code class="has-line-data" data-line-start="226" data-line-end="245" class="language-sh">sudo apt install php php-mysql php-cgi
- Para que o PHP interaja com o VPS, habilite o módulo usando os dois comandos seguintes:
sudo lighttpd-enable-mod fastcgi
sudo lighttpd-enable-mod fastcgi-php
-Agora pode avançar e recarregar o Lighttpd para que as alterações tenham efeito:
sudo service lighttpd force-reload
- Instalando e configurando o Wordpress:
sudo wget https://br.wordpress.org/latest-pt_BR.tar.gz
sudo tar -xzvf latest.tar.gz
se baixar o pacote no diretorio <span class="hljs-keyword">do</span> html basta lancar o comando:
sudo cp <span class="hljs-operator">-a</span> /var/www/html/wordpress/. /var/www/html
no diretorio onde esta o wp-config-sample.php (/var/www/html)
sudo cp wp-config-sample.php wp-config.php
No arquivo criado acima wp-config.php, Alterar os campos abaixo:
-&gt; Preencher o campo <span class="hljs-keyword">do</span> nome <span class="hljs-keyword">do</span> Banco de dados com o nome dado por voce na hora da instalacao <span class="hljs-keyword">do</span> Banco de Dados.
-&gt; Preencher o campo <span class="hljs-keyword">do</span> usuario com o nome dado por voce na hora da instalacao <span class="hljs-keyword">do</span> Banco de Dados.
-&gt; Preencher o campo da senha com a senha dada por voce na hora da instalacao <span class="hljs-keyword">do</span> Banco de Dados.
-&gt; Nesse projeto nao ha necessidade de alterecao em mais nada.
</code></pre>
<p class="has-line-data" data-line-start="245" data-line-end="246">→  Baixando e configurando o  FTP</p>
<pre><code class="has-line-data" data-line-start="247" data-line-end="265" class="language-sh">sudo apt install vsftpd
sudo systemctl start vsftpd
sudo systemctl <span class="hljs-built_in">enable</span> vsftpd
sudo ufw allow <span class="hljs-number">20</span>/tcp
sudo ufw allow <span class="hljs-number">21</span>/tcp
Adicionaar o usuario microdri a lista de usuarios de FTP permitidos:
<span class="hljs-built_in">echo</span> <span class="hljs-string">"microdri"</span> | sudo tee <span class="hljs-operator">-a</span> /etc/vsftpd.userlist
sudo systemctl restart vsftpd
sudo systemctl <span class="hljs-built_in">enable</span> vsftpd
sudo apt install ftp

para acessar via ftp basta digitar:
ftp -<span class="hljs-number">4</span> ipdamaquina.

configurar as permissoes para enviar e escrever arquivos usando FTP.
use o link abaixo para configurar:
link uteis → https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for<span class="hljs-operator">-a</span>-user<span class="hljs-operator">-s</span>-directory-on-ubuntu-<span class="hljs-number">20</span>-<span class="hljs-number">04</span> , https://phoenixnap.com/kb/linux-ftp ...
</code></pre>
<p class="has-line-data" data-line-start="267" data-line-end="268"><strong>Vamo que Vamooo</strong></p>
