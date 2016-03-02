# IesdePlayer

Helper de exibição de vídeos do WebService do [Iesde][siteiesde] para sistemas Rails. Não se trata de uma ferramenta oficial pois foi desenvolvida por necessidade dos nossos desenvolvedores. Sintam-se livres para contribuir.

## Versão
1.0.0 - Seguindo a documentação v14 do WebService

## Instalação

```sh
gem install iesde_player -v 1.0.1
```

Ou no seu Gemfile
```ruby
gem 'iesde_player', '~> 1.0.1'
```

Depois Adicionar em seu **application.js**:

```javascript
//= require iesde_player/application
```

## Uso

> O player é renderizado como uma tag <div> no html por meio da chamada do helper **iesde_player_div**
### Formato:
```ruby
<%= iesde_player_div(div_id, params) %>
```

### Exemplo mais simples
Em sua *view* adicione:
```ruby
<%= iesde_player_div "palco", user: 'aluno@eail.com', pass: '64727163829', course: '6376', movie_id: '4273' %>
```

Resultando no player no formato padrão:


![screenshot](https://raw.githubusercontent.com/fortesinformatica/iesde_player/master/readme_screenshot.png)

Onde:

Parâmetros Obrigatórios:
- **:user** - E-mail do aluno que irá assistir a aula
- **:pass** - CPF do aluno que irá assistir a aula
- **:course** - id do curso do qual a aula pertence
- **:movie_id** - id da aula que será assistida
> Todos os parâmetros são explicados na documentação do Iesde

Parâmetros Opcionais:
- **:width** - default ```"574"```
- **:height** - default ```"469"```
- **:auto_start** - default ```"false"```
- **:theme_color** - default ```"0395d3"```
- **:mode** - default ```"fit"```
- **:scale_mode** - default ```"stretch"```
- **:frame_color** - default ```"ffffff"```
- **:font_color** - default ```"000000"```
- **:course_type** - default ```"C"```
- **:allow_full_screen** - default ```"true"```
- **:allow_script_access** - default ```"always"```
- **:quality** - default ```"high"```
- **:allow_networking** - default ```"all"```

## Licença

MIT Licence. Copyright (c) 2016 Fortes Tecnologia. http://www.fortestecnologia.com.br

![ft](http://www.fortestecnologia.com.br/templates/fortesinfo/images/grupo-fortes.png)

[siteiesde]:<http://www.iesde.com.br>
