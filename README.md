Tesoureiro
==========
O Tesoureiro é um pequeno projeto em Ruby on Rails para controle financeiro pessoal.
Nele você simplesmente lança suas transações financeira, previstas ou realizadas e vai acompanhando a sua grana.
![Lista de Transações](http://i50.tinypic.com/ke9f9i.png)

## Caixas ##
Você tem a opções de separa seu dinheiro em diferentes caixas. Pro exemplo, um caixa seu e outro da sua esposa(o), ou então um caixa para cada conta corrente que tiver.
![Caixas](http://i49.tinypic.com/lgnqf.png)

# Como utilizo? 
O tesoureiro é um projeto em Ruby on Rails. 

Depois de clonar este repositório no git basta iniciar o servidor do rails em modo de produção:

```bash
git clone git@github.com:Rudiney/tesoureiro.git
cd tesoureiro
bundle install
rake db:create
rake db:migrate
rails server -e production
```