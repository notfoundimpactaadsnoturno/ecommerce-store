#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["./services/EcommerceStore.Identidade.API/EcommerceStore.Identidade.API.csproj", "services/EcommerceStore.Identidade.API/"]
COPY ["./building blocks/EcommerceStore.WebApi.Core/EcommerceStore.WebApi.Core.csproj", "building blocks/EcommerceStore.WebApi.Core/"]
COPY ["./building blocks/EcommerceStore.Core/EcommerceStore.Core.csproj", "building blocks/EcommerceStore.WebApi.Core/"]
COPY ["./building blocks/EcommerceStore.MessageBus/EcommerceStore.MessageBus.csproj", "building blocks/EcommerceStore.MessageBus/"]

RUN dotnet restore "services/EcommerceStore.Identidade.API/EcommerceStore.Identidade.API.csproj"
COPY . .
WORKDIR "services/EcommerceStore.Identidade.API"
RUN dotnet build "EcommerceStore.Identidade.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "EcommerceStore.Identidade.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "EcommerceStore.Identidade.API.dll"]