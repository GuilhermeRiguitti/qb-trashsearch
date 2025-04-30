# qb-trashsearch

Um sistema de vasculhamento de lixeiras para QBCore que permite aos jogadores encontrar materiais de crafting em lixeiras espalhadas pelo mapa.

## Características

- Vasculhe lixeiras para encontrar materiais como sucata, borracha, aço e mais
- Sistema configurável de chances de encontrar diferentes itens
- Compatível com sistema de target (qb-target) e interação baseada em teclas
- Animações realistas de vasculhamento

## Instalação

1. Coloque a pasta `qb-trashsearch` no diretório `resources/[qb]`
2. Adicione `ensure qb-trashsearch` ao seu server.cfg
3. Reinicie o servidor

## Configuração

Você pode ajustar todas as configurações no arquivo `config.lua`:
- Modelos de lixeiras que podem ser vasculhadas
- Chances de item e quantidades
- Tempo de busca e cooldown
- E muito mais

## Autor

**Guilherme Riguitti**
- GitHub: [https://github.com/GuilhermeRiguitti](https://github.com/GuilhermeRiguitti)

Copyright (c) 2023 Guilherme Riguitti

## Itens necessarios no qb-core/shared
<!-- 
    -- Materiais básicos
    ['metalscrap'] = {['name'] = 'metalscrap', ['label'] = 'Sucata de Metal', ['weight'] = 50, ['type'] = 'item', ['image'] = 'metalscrap.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Sucata de metal usada para fabricação'},
    ['steel'] = {['name'] = 'steel', ['label'] = 'Aço', ['weight'] = 50, ['type'] = 'item', ['image'] = 'steel.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Aço usado para fabricação'},
    ['rubber'] = {['name'] = 'rubber', ['label'] = 'Borracha', ['weight'] = 50, ['type'] = 'item', ['image'] = 'rubber.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Borracha usada para fabricação'},
    ['copper'] = {['name'] = 'copper', ['label'] = 'Cobre', ['weight'] = 50, ['type'] = 'item', ['image'] = 'copper.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Cobre usado para fabricação'},
    
    -- Peças de armas
    ['pistol_part_1'] = {['name'] = 'pistol_part_1', ['label'] = 'Frame de Pistola', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pistol_frame.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Frame para construção de uma pistola'},
    ['pistol_part_2'] = {['name'] = 'pistol_part_2', ['label'] = 'Slide de Pistola', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pistol_slide.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Slide para construção de uma pistola'},
    ['pistol_part_3'] = {['name'] = 'pistol_part_3', ['label'] = 'Empunhadura de Pistola', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pistol_grip.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Empunhadura para construção de uma pistola'},
    ['pistol_part_4'] = {['name'] = 'pistol_part_4', ['label'] = 'Gatilho de Pistola', ['weight'] = 500, ['type'] = 'item', ['image'] = 'pistol_trigger.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Gatilho para construção de uma pistola'},
    
    ['smg_part_1'] = {['name'] = 'smg_part_1', ['label'] = 'Receiver de SMG', ['weight'] = 500, ['type'] = 'item', ['image'] = 'smg_receiver.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Receiver para construção de uma SMG'},
    ['smg_part_2'] = {['name'] = 'smg_part_2', ['label'] = 'Cano de SMG', ['weight'] = 500, ['type'] = 'item', ['image'] = 'smg_barrel.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Cano para construção de uma SMG'},
    ['smg_part_3'] = {['name'] = 'smg_part_3', ['label'] = 'Coronha de SMG', ['weight'] = 500, ['type'] = 'item', ['image'] = 'smg_stock.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Coronha para construção de uma SMG'},
    ['smg_part_4'] = {['name'] = 'smg_part_4', ['label'] = 'Carregador de SMG', ['weight'] = 500, ['type'] = 'item', ['image'] = 'smg_magazine.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Carregador para construção de uma SMG'}, -->

