#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["./web/EcommerceStore.WebApp.MVC/EcommerceStore.WebApp.MVC.csproj", "web/EcommerceStore.WebApp.MVC/"]
COPY ["./building blocks/EcommerceStore.WebApi.Core/EcommerceStore.WebApi.Core.csproj", "building blocks/EcommerceStore.WebApi.Core/"]
COPY ["./building blocks/EcommerceStore.Core/EcommerceStore.Core.csproj", "building blocks/EcommerceStore.WebApi.Core/"]
RUN dotnet restore "web/EcommerceStore.WebApp.MVC/EcommerceStore.WebApp.MVC.csproj"
COPY . .
WORKDIR "web/EcommerceStore.WebApp.MVC"
RUN dotnet build "EcommerceStore.WebApp.MVC.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "EcommerceStore.WebApp.MVC.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "EcommerceStore.WebApp.MVC.dll"]