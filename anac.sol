// SPDX-License-Identifier: MIT
pragma solidity ^0.4.22;

/// @title ANAC - Gerenciamento de Idade e Documentação de Passageiros
/// @notice Este contrato gerencia a idade e a nacionalidade de um passageiro, determinando a documentação necessária conforme a regra de negócio.
/// @dev O contrato inicia com a idade padrão de 18 anos e nacionalidade brasileira (true). Somente o dono pode alterar os dados.
contract ANAC {
    // Variável de estado que armazena a idade do passageiro.
    // Inicialmente, o passageiro tem 18 anos.
    uint256 private idade = 18;

    // Variável que armazena a nacionalidade do passageiro.
    // true indica brasileiro; false, estrangeiro.
    bool private isBrasileiro = true;

    // Variável que armazena o endereço do dono do contrato.
    address public owner;

    // Evento emitido sempre que a idade for atualizada.
    event IdadeAtualizada(uint256 novaIdade);

    /// @notice Construtor que define o criador do contrato como dono.
    constructor() public {
        owner = msg.sender;
    }

    /// @notice Altera a idade armazenada no contrato.
    /// @dev Somente o dono do contrato pode chamar esta função.
    /// @param _novaIdade A nova idade a ser definida.
    function setIdade(uint256 _novaIdade) public {
        require(msg.sender == owner, "Apenas o dono pode alterar a idade.");
        idade = _novaIdade;
        emit IdadeAtualizada(_novaIdade);
    }

    /// @notice Retorna a idade atual armazenada no contrato.
    /// @return A idade do passageiro.
    function getIdade() public view returns (uint256) {
        return idade;
    }

    /// @notice Altera a nacionalidade armazenada no contrato.
    /// @dev Somente o dono do contrato pode chamar esta função.
    /// @param _isBrasileiro true para brasileiro, false para estrangeiro.
    function setNacionalidade(bool _isBrasileiro) public {
        require(msg.sender == owner, "Apenas o dono pode alterar a nacionalidade.");
        isBrasileiro = _isBrasileiro;
    }

    /// @notice Retorna a documentação necessária de acordo com a regra de negócio e a nacionalidade armazenada.
    /// @dev Para brasileiros, a documentação varia conforme a idade (adulto ou criança/adolescente).
    /// Para estrangeiros, a documentação é a mesma independentemente da idade.
    /// @return Uma string com a documentação necessária.
    function getDocumentacao() public view returns (string memory) {
        if (isBrasileiro) {
            if (idade >= 18) {
                // Passageiro adulto brasileiro.
                return "Adulto Brasileiro: Necessita de RG, CPF e CNH.";
            } else {
                // Passageiro criança/adolescente brasileiro.
                return "Crianca/Adolescente Brasileiro: Necessita de Certidao de Nascimento e Carteira de Vacina.";
            }
        } else {
            // Passageiro estrangeiro, independente da idade.
            return "Estrangeiro: Necessita de Passaporte e Visto.";
        }
    }
}
