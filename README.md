# Arslan Vision - Night Vision and Thermal Vision Script

## Priviev
[Priviev](https://streamable.com/zzrors)

## Overview EN
Arslan Vision is a FiveM script that allows players to use Night Vision and Thermal Vision items in the game. The script enables players to toggle these vision modes using the items `nightvision` and `thermalvision` in their inventory. The script is designed for use with the QBCore framework and provides an immersive experience by integrating animations and cooldowns.

## Genel Bakış TR
Arslan Vision, oyuncuların oyunda Gece Görüşü ve Termal Görüş öğelerini kullanmalarını sağlayan bir FiveM scriptidir. Script, oyuncuların envanterlerindeki `nightvision` ve `thermalvision` öğelerini kullanarak bu görüş modlarını değiştirmelerini sağlar. Kod, QBCore çerçevesi ile kullanılmak üzere tasarlanmıştır ve animasyonları ve bekleme sürelerini entegre ederek sürükleyici bir deneyim sağlar.

## Features EN
- **Night Vision**: Toggle the night vision mode with an item.
- **Thermal Vision**: Toggle the thermal vision mode with an item. Includes a cooldown feature to prevent overuse.
- **Animations**: Players perform an animation when toggling the vision modes.
- **Cooldown**: Thermal vision has a cooldown period after use, preventing it from being activated immediately again.

## Özellikler TR
- **Gece Görüşü**: Bir öğe ile gece görüş modunu değiştirin.
- **Termal Görüş**: Termal görüş modunu bir eşya ile değiştirir. Aşırı kullanımı önlemek için bir bekleme süresi özelliği içerir.
- **Animasyonlar**: Oyuncular görüş modlarını değiştirirken bir animasyon gerçekleştirir.
- **Bekleme süresi**: Termal görüş, kullanımdan sonra hemen tekrar etkinleştirilmesini engelleyen bir bekleme süresine sahiptir.

## Installation EN

1. Download or clone the repository.
2. Place the `arslan-vision` folder into your `resources` directory.
3. Codes to be inserted into items.lua:
nightvision                  = { name = 'nightvision', label = 'Gece Görüş Kamerası', weight = 100, 'item', image = 'nightvision.png', unique = true, useable = true, shouldClose = true, description = 'Görüşünüzü karanlıkta bile artıran gözlük.' },
thermalvision                = { name = 'thermalvision', label = 'Termal Görüş Kamerası', weight = 100, 'item', image = 'thermalvision.png', unique = true, useable = true, shouldClose = true, description = 'Sıcaklık kaynaklarını algılayabilen gözlük.' },
4. Put the codes above into [qb]/qb-core/shared/items.lua.
5. Put the images in the images folder into [qb]/qb-inventory/html/images.
6. Add the following line to your `server.cfg` to ensure the script is started on server boot: start arslan-vision 

## Kurulum TR

1. Repository'i indirin veya kopyalayın.
2. `arslan-vision` klasörünü `resources` dizininize yerleştirin.
3. items.lua içine eklenecek kodlar:
nightvision                  = { name = 'nightvision', label = 'Gece Görüş Kamerası', weight = 100, 'item', image = 'nightvision.png', unique = true, useable = true, shouldClose = true, description = 'Görüşünüzü karanlıkta bile artıran gözlük.' },
thermalvision                = { name = 'thermalvision', label = 'Termal Görüş Kamerası', weight = 100, 'item', image = 'thermalvision.png', unique = true, useable = true, shouldClose = true, description = 'Sıcaklık kaynaklarını algılayabilen gözlük.' },
4. Yukarıdaki kodları [qb]/qb-core/shared/items.lua dosyasına yerleştirin.
5. images klasöründeki resimleri [qb]/qb-inventory/html/images içine yerleştirin.
6. Script'in sunucu açılışında başlatıldığından emin olmak için `server.cfg` dosyanıza aşağıdaki satırı ekleyin: `start arslan-vision`