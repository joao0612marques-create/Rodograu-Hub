-- Script para spawnar motos da GamePass com sistema antiban no Rodograu 2.0

-- Função principal para spawnar uma moto específica
local function spawnMoto(motoName)
    local motosService = game:GetService("Workspace"):FindFirstChild("Motos") -- Certifique-se de que o nome da pasta esteja correto

    if motosService then
        -- Verifica se a moto está disponível
        local motoModel = motosService:FindFirstChild(motoName)
        if motoModel then
            -- Clona a moto e spawna próximo ao jogador
            local clonedMoto = motoModel:Clone()
            clonedMoto.Parent = game:GetService("Workspace")
            clonedMoto:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
            print("Moto spawnada com sucesso: " .. motoName)
        else
            warn("Moto não encontrada: " .. motoName)
        end
    else
        warn("Serviço de motos não encontrado no Workspace")
    end
end

-- Função para spawnar motos com proteção básica contra sistemas antiban
local function spawnComProtecao(motoName)
    spawn(function()
        task.wait(2) -- Adiciona um pequeno atraso para mitigar possíveis detecções
        spawnMoto(motoName)
    end)
end

-- Lista de motos disponíveis na GamePass que o jogador pode spawnar
local motosParaSpawnar = {"F800", "Titan1602025", "CB500"} -- Substitua pelos nomes corretos das motos

-- Spawnando as motos de exemplo
for _, moto in ipairs(motosParaSpawnar) do
    spawnComProtecao(moto)
end