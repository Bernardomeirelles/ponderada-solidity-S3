# ANAC Smart Contract

## Introdução

O contrato inteligente **ANAC** gerencia a idade e a nacionalidade de um passageiro, determinando qual documentação é necessária conforme regras de negócio pré-definidas. Inicialmente, o passageiro possui 18 anos e é considerado brasileiro.

## Objetivos

- **Gerenciamento de Idade:**  
  Armazenar e permitir a atualização da idade do passageiro.

- **Gerenciamento de Nacionalidade:**  
  Armazenar e permitir a atualização da nacionalidade do passageiro, identificando-o como brasileiro ou estrangeiro.

- **Determinação da Documentação Necessária:**  
  Com base na idade e na nacionalidade, o contrato informa qual documentação é exigida:
  - **Adulto Brasileiro (idade ≥ 18):** RG, CPF e CNH.
  - **Criança/Adolescente Brasileiro (idade < 18):** Certidão de Nascimento e Carteira de Vacina.
  - **Estrangeiro (independente da idade):** Passaporte e Visto.

## Variáveis de Estado

- **Idade:**  
  Uma variável privada que armazena a idade do passageiro, iniciando com o valor 18.

- **Nacionalidade:**  
  Uma variável privada que indica se o passageiro é brasileiro (`true`) ou estrangeiro (`false`).

- **Owner:**  
  Uma variável pública que guarda o endereço do dono do contrato. O endereço que realiza o deploy do contrato é automaticamente definido como o owner e tem privilégios especiais para alterar dados sensíveis.

## Funções Principais

- **Construtor:**  
  Ao fazer o deploy, o contrato define a conta que o criou como owner.

- **setIdade:**  
  Permite alterar a idade armazenada. Apenas o owner pode utilizar essa função para atualizar o valor.

- **getIdade:**  
  Retorna a idade atual armazenada. Essa função é de leitura e pode ser chamada por qualquer usuário sem custo.

- **setNacionalidade:**  
  Permite alterar a nacionalidade (brasileiro ou estrangeiro). Assim como a função de alteração de idade, apenas o owner pode executá-la.

- **getDocumentacao:**  
  Com base nos valores atuais de idade e nacionalidade, esta função retorna a documentação necessária:
  - Se o passageiro é brasileiro, a documentação varia conforme a idade (adulto ou criança/adolescente).
  - Se o passageiro é estrangeiro, a documentação é fixa, independentemente da idade.

## Permissões e Acesso

- **Owner (Dono do Contrato):**  
  A conta que faz o deploy é definida como owner e possui permissão exclusiva para alterar a idade e a nacionalidade, utilizando as funções `setIdade` e `setNacionalidade`.

- **Outras Contas:**  
  Usuários que não são o owner não podem alterar os dados sensíveis. Caso tentem, a transação será revertida devido aos controles de acesso implementados.

## Instruções de Uso no Remix IDE

- **Deploy:**  
  Ao fazer o deploy do contrato, a conta utilizada é automaticamente definida como owner.

- **getIdade:**  
  Utilize este botão para visualizar a idade atual armazenada no contrato. Esta função não consome gás, pois é apenas de leitura.

- **setIdade:**  
  Utilize este botão para alterar a idade do passageiro. Lembre-se de que apenas o owner pode executar essa função; tentativas de outros endereços resultarão em erro.

- **setNacionalidade:**  
  Utilize este botão para modificar a nacionalidade do passageiro (defina `true` para brasileiro ou `false` para estrangeiro). Assim como na alteração da idade, apenas o owner pode realizar esta operação.

- **getDocumentacao:**  
  Utilize este botão para consultar a documentação necessária, que será determinada com base na idade e na nacionalidade atualmente armazenadas no contrato.

## Demonstração

Para ver uma demonstração prática do funcionamento do contrato, [clique aqui para ver o Vídeo](https://youtu.be/GJXpq-jj5LM).

## Conclusão

O contrato **ANAC** exemplifica o controle de acesso em Solidity, garantindo que apenas o owner possa modificar informações sensíveis, enquanto fornece informações dinâmicas e relevantes sobre a documentação necessária para diferentes perfis de passageiros. Este design torna o contrato eficiente, seguro e fácil de testar e monitorar.


## Explicação do Uso de Ia generativa: 


A IA generativa foi um auxiliador no desenvolvivemnto do Smart Contract provendo  códigos e insights para a solução do case. Em especifico na criação de funções GET e SET, comentários no codigo e modificação da versão da licença usada.