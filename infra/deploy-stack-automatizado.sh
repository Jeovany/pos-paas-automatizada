#!/bin/bash

# Função para substituir os valores no arquivo cloudformation-stack.yaml
substituir_valores() {
    sed -i "s/@@SnsName@@/$SnsName/g" cloudformation-stack.yaml
    sed -i "s/@@SqsQueueDqlName@@/$SqsQueueDqlName/g" cloudformation-stack.yaml
    sed -i "s/@@SqsQueueName@@/$SqsQueueName/g" cloudformation-stack.yaml
    sed -i "s/@@LambdaName@@/$LambdaName/g" cloudformation-stack.yaml
    sed -i "s/@@S3Key@@/$S3Key/g" cloudformation-stack.yaml
    sed -i "s/@@TableName@@/$TableName/g" cloudformation-stack.yaml
}

# Função para exibir o menu
exibir_menu() {
    echo "Escolha uma opção:"
    echo "1. iot-consumo-energia"
    echo "2. iot-direcao-vento"
    echo "3. iot-ph-agua"
    echo "4. iot-ph-solo"
    echo "5. iot-preciptacao-acumulada"
    echo "6. iot-sistema-refrigeracao"
    echo "7. iot-temperatura"
    echo "8. iot-umidade"
    echo "9. Sair"
}

# Loop do menu
while true; do
    exibir_menu

    # Ler a opção do usuário
    read -p "Digite o número da opção desejada: " opcao

    case $opcao in
        1)
            SnsName=sns-iot-consumo-energia
            SqsQueueDqlName=sqs-iot-consumo-energia-dlq
            SqsQueueName=sqs-iot-consumo-energia
            LambdaName=iot-consumo-energia-lambda
            S3Key=iot-consumo-energia
            TableName=iot-consumo-energia
            cp cloudformation-stack.yaml ../iot-consumo-energia/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-consumo-energia/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-consumo-energia."
            ;;

        2)
            SnsName=sns-iot-direcao-vento
            SqsQueueDqlName=sqs-iot-direcao-vento-dlq
            SqsQueueName=sqs-iot-direcao-vento
            LambdaName=iot-direcao-vento-lambda
            S3Key=iot-direcao-vento
            TableName=iot-direcao-vento
            cp cloudformation-stack.yaml ../iot-direcao-vento/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-direcao-vento/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-direcao-vento."
            ;;

        3)
            SnsName=sns-iot-ph-agua
            SqsQueueDqlName=sqs-iot-ph-agua-dlq
            SqsQueueName=sqs-iot-ph-agua
            LambdaName=iot-ph-agua-lambda
            S3Key=iot-ph-agua
            TableName=iot-ph-agua
            cp cloudformation-stack.yaml ../iot-ph-agua/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-ph-agua/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-ph-agua."
            ;;

        4)
            SnsName=sns-iot-ph-solo
            SqsQueueDqlName=sqs-iot-ph-solo-dlq
            SqsQueueName=sqs-iot-ph-solo
            LambdaName=iot-ph-solo-lambda
            S3Key=iot-ph-solo
            TableName=iot-ph-solo
            cp cloudformation-stack.yaml ../iot-ph-solo/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-ph-solo/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-ph-solo."
            ;;

        5)
            SnsName=sns-iot-preciptacao-acumulada
            SqsQueueDqlName=sqs-iot-preciptacao-acumulada-dlq
            SqsQueueName=sqs-iot-preciptacao-acumulada
            LambdaName=iot-preciptacao-acumulada-lambda
            S3Key=iot-preciptacao-acumulada
            TableName=iot-preciptacao-acumulada
            cp cloudformation-stack.yaml ../iot-preciptacao-acumulada/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-preciptacao-acumulada/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-preciptacao-acumulada."
            ;;

        6)
            SnsName=sns-iot-sistema-refrigeracao
            SqsQueueDqlName=sqs-iot-sistema-refrigeracao-dlq
            SqsQueueName=sqs-iot-sistema-refrigeracao
            LambdaName=iot-sistema-refrigeracao-lambda
            S3Key=iot-sistema-refrigeracao
            TableName=iot-sistema-refrigeracao
            cp cloudformation-stack.yaml ../iot-sistema-refrigeracao/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-sistema-refrigeracao/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-sistema-refrigeracao."
            ;;

        7)
            SnsName=sns-iot-temperatura
            SqsQueueDqlName=sqs-iot-temperatura-dlq
            SqsQueueName=sqs-iot-temperatura
            LambdaName=iot-temperatura-lambda
            S3Key=iot-temperatura
            TableName=iot-temperatura
            cp cloudformation-stack.yaml ../iot-temperatura/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-temperatura/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-temperatura."
            ;;

        8)
            SnsName=sns-iot-umidade
            SqsQueueDqlName=sqs-iot-umidade-dlq
            SqsQueueName=sqs-iot-umidade
            LambdaName=iot-umidade-lambda
            S3Key=iot-umidade
            TableName=iot-umidade
            cp cloudformation-stack.yaml ../iot-umidade/  # Copia o arquivo YAML para o diretório correspondente
            cd ../iot-umidade/  # Entra no diretório escolhido
            substituir_valores
            echo "Valores atualizados para iot-umidade."
            ;;

        9)
            echo "Saindo do script. Até logo!"
            exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    # Verifica se o arquivo cloudformation-stack.yaml existe no diretório atual
    if [ ! -f "cloudformation-stack.yaml" ]; then
        echo "Erro: Arquivo 'cloudformation-stack.yaml' não encontrado no diretório."
        echo "Certifique-se de que o arquivo está presente antes de prosseguir."
        cd ..  # Volta para o diretório principal
        continue  # Volta ao início do loop para exibir o menu novamente
    fi

    # Comandos adicionados após a escolha da opção
    zip "$S3Key.zip" lambda.py requirements.txt

    aws s3 cp "$S3Key.zip" s3://inserir-um-nome-unico-globalmente-jeovany/"$S3Key.zip" --profile=aws-academy

    aws cloudformation create-stack --profile=aws-academy --stack-name $S3Key --capabilities CAPABILITY_IAM --template-body file://cloudformation-stack.yaml

    cd ../infra  # Volta para o diretório principal após a execução
done
