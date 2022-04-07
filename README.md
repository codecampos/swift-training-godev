## 🍎 Treinamento com formação em Swift (iOS) 
- Programa go!dev by [Idwall](https://idwall.co/) / [Gama Academy](https://www.gama.academy/)
- Repositório criado para armazenar o conteúdo das aulas, como também dos desafios passados pelo professor
## Realização: 
<div align="center">
  <a href="https://github.com/codecampos">
  <img height="180em" src="https://godev-idwall.corporate.gama.academy/wp-content/uploads/sites/20//2021/12/Idwall-logo.svg"/>
  <img height="180em" src="https://godev-idwall.corporate.gama.academy/wp-content/uploads/sites/20//2021/12/MARCA__RGB__GAMA-ACADEMY__COR__HORIZONTAL.svg"/>    
</div>
  
 ## 🚀 Desafios
  - #### [Criação da estrutura de dados pilha](https://github.com/codecampos/swift-training-godev/tree/main/challenges/palindrome/Palindrome.playground)
  
    ```swift
      // Trecho do Código
      func push(book: String) {
          books.append(book)
          top = top + 1
      }
    
      func pop() {
          if (!books.isEmpty) {
              books.remove(at: top)
              top = top - 1
          } else {
              isEmpty()
          }
      }  
    ```
  
  - #### [Criação de um algoritmo que faça a checagem se uma palavra passada é um palíndromo](https://github.com/codecampos/swift-training-godev/tree/main/challenges/stack%20data%20structure)
  
    ```swift
      // Trecho do Código
      func isPalindrome(_ word:String) {
          if (word == String(word.reversed())) {
             print("A palavra \(word) é um palíndromo")
          } else {
            print("A palavra \(word) não é um palíndromo")
          }
      }
    ```
  
  - #### [Criação de uma tela de login - Storyboard](https://github.com/codecampos/swift-training-godev/tree/main/challenges/purple%20music%20school)
    - A minha ideia foi criar uma tela de login para uma escola de música fictícia chamada Purple Music School: 
      - Validações: 
        
        <p>Exibir um __alert__ informando sucesso na autenticação, caso seja informado o email e senha que já está armazenado no código. Exibir um __alert__ informando falha na autenticação nos seguintes casos: quando não seja informado um email com formatação válida, quando houver clique no botão de entrar sem ter informado email e senha, e por último, quando seja informado email e senha que não seja o que está cadastrado no código. </p>

 ![UI](https://github.com/codecampos/images/blob/main/purple.png)
  
  - #### [Criação de uma tela de login - View Code](https://github.com/codecampos/swift-training-godev/tree/main/challenges/purple%20music%20school%20viewCode)
    - Recriação do desafio anterior da tela de login utilizando View Code invés de Storyboard
      
  - #### [Clone da tela inicial do Whatsapp - ViewCode](https://github.com/codecampos/swift-training-godev/tree/main/challenges/WhatsappClone)
    - Em andamento. 
     
 ![UI](https://github.com/codecampos/images/blob/main/whatsapp.png)
 </br> </br>

