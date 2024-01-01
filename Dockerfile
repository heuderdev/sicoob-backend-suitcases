# Use uma imagem base do Node.js para construir
FROM node:18 AS build

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie package.json e package-lock.json para instalar as dependências
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie os arquivos do código-fonte
COPY . .

# Compile o TypeScript
RUN npm run build

# Use uma imagem menor do Node.js para a execução
FROM node:18-alpine

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie apenas os arquivos necessários do estágio de build
COPY --from=build /usr/src/app/dist ./dist
COPY package*.json ./

# Instale apenas as dependências de produção
RUN npm install --only=production

# Exponha a porta que a aplicação estará ouvindo
EXPOSE 3000

# Comando para iniciar a aplicação
CMD [ "npm", "start" ]
