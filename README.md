# Descrição do Projeto

O Matrícula Coordenador é um projeto que visa a automação do processo de matrícula feito pelo coordenador para as disciplinas que precisam de um requerimento de matrícula.

## Como instalar e executar o sistema?

- O Primeiro passe é ter o ambiente de desenvolvimento funcionando (Ruby 2.5 e Rails 5.2.1);
- Caso não saiba como instalar o ruby, basta seguir o passo a passo neste tutorial: [Ruby with RVM](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html)

* Após ter o ambiente configurado, basta clonar o projeto deste repositório:

```sh
git clone git@github.com:EngSwCIC/matricula-coordenador.git
```

### Configurando e executando a aplicação

- Antes dos próximos passos, é interessante verificar se o banco de dados local está configurado corretamente (o padrão utilizado no projeto é o postgres), isso pode ser feito no arquivo /config/database.yml.

* Após fazer isso é necessário entrar na pasta do projeto clonado e executar o seguinte comando no terminal:

```sh
gem install bundler
```

```sh
bundler install
```

- Isso instalará as dependencias necessárias descritas no Gemfile;

- Após terminar a instalação das depencias, crie o seu banco, executando o comando:

```sh
rails db:create
```

- Crie as tabelas e seus relacionamento já existentes, com o seguinte comando:

```sh
rails db:migrate
```

- Enfim, popule o banco com alguns dados já existentes e definidos (no arquivo /db/seeds.rb):

```sh
rails db:seed
```

- Para subir o server com a aplicação em ambiente local basta executar:

```
rails s
```

# WIKI

- Para qualquer dúvida não explicitada no README, visite a (WIKI)[https://github.com/EngSwCIC/matricula-coordenador/wiki]
