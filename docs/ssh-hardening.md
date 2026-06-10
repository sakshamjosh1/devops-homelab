everythign that we will be doing will be managed over ssh
when this actually is moved to a real server aws
a poorly configured ssh is the most common entrypoint for attackers on linux servers

Permitrootlogin: if its yes, anyone can directly ssh into your machine as root. dangerous
                    thats why it is set to no generally

password authentication: it permits if you can ssh using password or not
                                its dangerous as anyone can bruteforce into finding out your password
                                thats why ssh key paiirs are stored in a cryptographic key
                                that cant be guessed

default port 22: every automated bot tries port 22 constantly
                    changing it doesnt make your app secure but eliminates 99% of automated norse in your logs
                    not a defence but reduces attack surfaces

SSH works in a way that anyone as a user can access another machine from a different part of the world
like i in india can access a linux machine in australia, given that i have appropriate permit and a security key
this makes only authorized user have access to the important servers
