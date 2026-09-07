#!/usr/bin/env python3
"""Inject role-play difficulty variants into all *.i18n.json files."""

from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1] / "lib" / "i18n"

# baseId -> { easy|medium|hard: (key, en, tr) }
# Each value is full scenario block content.
VARIANTS: dict[str, dict[str, tuple[str, dict, dict]]] = {
    "shoppingClothes": {
        "easy": (
            "shoppingFittingRoom",
            {
                "title": "Trying Clothes in the Fitting Room",
                "screenplay": "Ask for a different size, check the mirror, and decide whether to buy the outfit.",
                "chat": {
                    "briefing": "Hi! Today we'll practice in a fitting room — sizes, colors, and deciding to buy. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "How's that size working for you?",
                    "outgoing1": "It's a bit tight. Do you have a larger size?",
                    "incoming2Highlight": "Sure",
                    "incoming2Rest": "! I'll grab the next size for you.",
                    "botReply": "Want to try another color while I check?",
                },
            },
            {
                "title": "Soyunma Kabininde Kıyafet Denemek",
                "screenplay": "Farklı beden iste, aynada kontrol et ve kıyafeti alıp almayacağına karar ver.",
                "chat": {
                    "briefing": "Merhaba! Bugün soyunma kabininde pratik yapacağız — beden, renk, satın alma kararı. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "O beden nasıl oldu?",
                    "outgoing1": "Biraz dar. Bir büyük bedeni var mı?",
                    "incoming2Highlight": "Tabii",
                    "incoming2Rest": "! Hemen bir büyük bedeni getireyim.",
                    "botReply": "Bakarken başka bir renk de denemek ister misin?",
                },
            },
        ),
        "medium": (
            "shoppingReturn",
            {
                "title": "Returning an Item to the Store",
                "screenplay": "Return a purchase politely — explain the reason, show the receipt, and ask for a refund or exchange.",
                "chat": {
                    "briefing": "Hi! Today we'll practice returning an item — being polite, explaining why, and asking for a refund. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "Hi! How can I help you today?",
                    "outgoing1": "I'd like to return this shirt. It doesn't fit well.",
                    "incoming2Highlight": "No problem",
                    "incoming2Rest": ". Do you have the receipt with you?",
                    "botReply": "Would you prefer a refund or an exchange?",
                },
            },
            {
                "title": "Mağazaya Ürün İade Etmek",
                "screenplay": "Kibar bir şekilde iade yap — sebebi açıkla, fişi göster, iade veya değişim iste.",
                "chat": {
                    "briefing": "Merhaba! Bugün ürün iadesi pratik edeceğiz — kibar olmak, sebebi anlatmak, iade istemek. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "Merhaba! Size nasıl yardımcı olabilirim?",
                    "outgoing1": "Bu gömleği iade etmek istiyorum. Üzerime olmadı.",
                    "incoming2Highlight": "Sorun değil",
                    "incoming2Rest": ". Fişiniz yanınızda mı?",
                    "botReply": "İade mi yoksa değişim mi istersiniz?",
                },
            },
        ),
        "hard": (
            "shoppingDiscount",
            {
                "title": "Asking About a Discount",
                "screenplay": "Ask about sales, student discounts, or price matches, then decide whether the deal is worth it.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking about discounts and sales. I'll teach a few phrases first, then we'll role-play. Ready?",
                    "incoming1": "That jacket looks great on you!",
                    "outgoing1": "Thanks! Is it on sale, or do you have any discounts today?",
                    "incoming2Highlight": "Actually",
                    "incoming2Rest": ", there's 20% off if you buy two items.",
                    "botReply": "Student discount is also available with ID.",
                },
            },
            {
                "title": "İndirim Hakkında Sormak",
                "screenplay": "İndirim, öğrenci indirimi veya fiyat eşleştirme sor; fırsatın değip değmediğine karar ver.",
                "chat": {
                    "briefing": "Merhaba! Bugün indirim sormayı pratik edeceğiz. Önce birkaç ifade, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "O ceket üzerinizde harika duruyor!",
                    "outgoing1": "Teşekkürler! İndirimde mi, yoksa bugün özel bir kampanya var mı?",
                    "incoming2Highlight": "Aslında",
                    "incoming2Rest": ", iki ürün alırsanız yüzde 20 indirim var.",
                    "botReply": "Öğrenci kimliğiyle de indirim yapabiliyoruz.",
                },
            },
        ),
    },
    "flirtingMeet": {
        "easy": (
            "flirtingCompliment",
            {
                "title": "Giving a Friendly Compliment",
                "screenplay": "Start with a light compliment, keep it respectful, and see if the other person wants to keep talking.",
                "chat": {
                    "briefing": "Hi! Today we'll practice giving a friendly compliment — short, kind, and natural. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "Oh, excuse me — I almost bumped into you.",
                    "outgoing1": "No worries! By the way, I like your jacket.",
                    "incoming2Highlight": "Thanks",
                    "incoming2Rest": "! That's sweet of you to say.",
                    "botReply": "Are you waiting for someone, or just hanging out?",
                },
            },
            {
                "title": "Kibar Bir İltifat Etmek",
                "screenplay": "Hafif bir iltifatla başla, saygılı ol ve karşı tarafın sohbete devam etmek isteyip istemediğini gör.",
                "chat": {
                    "briefing": "Merhaba! Bugün kibar iltifat etmeyi pratik edeceğiz — kısa, nazik, doğal. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Pardon — az kalsın çarpışıyorduk.",
                    "outgoing1": "Sorun değil! Bu arada, ceketin çok güzelmiş.",
                    "incoming2Highlight": "Teşekkürler",
                    "incoming2Rest": "! Ne güzel söyledin.",
                    "botReply": "Birini mi bekliyorsun, yoksa öyle mi takılıyorsun?",
                },
            },
        ),
        "medium": (
            "flirtingAskOut",
            {
                "title": "Asking Someone Out",
                "screenplay": "After a short chat, suggest meeting again — coffee, a walk, or a movie — and handle a yes or a soft no gracefully.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking someone out politely. I'll explain first, then we'll act it out. Ready?",
                    "incoming1": "I've really enjoyed talking with you.",
                    "outgoing1": "Me too. Would you like to grab coffee sometime this week?",
                    "incoming2Highlight": "I'd love that",
                    "incoming2Rest": ". What day works for you?",
                    "botReply": "Saturday afternoon is free for me.",
                },
            },
            {
                "title": "Birini Dışarı Davet Etmek",
                "screenplay": "Kısa sohbetten sonra tekrar buluşmayı öner — kahve, yürüyüş veya film — evet veya nazik hayırı güzel karşıla.",
                "chat": {
                    "briefing": "Merhaba! Bugün kibarca birini dışarı davet etmeyi pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?",
                    "incoming1": "Seninle konuşmak gerçekten keyifliydi.",
                    "outgoing1": "Benim için de. Bu hafta bir kahve içmek ister misin?",
                    "incoming2Highlight": "Çok isterim",
                    "incoming2Rest": ". Senin için hangi gün uygun?",
                    "botReply": "Cumartesi öğleden sonra müsaitim.",
                },
            },
        ),
        "hard": (
            "flirtingAwkward",
            {
                "title": "Handling an Awkward Moment",
                "screenplay": "Recover from a misunderstanding or awkward pause, apologize lightly, and steer the chat back to a comfortable topic.",
                "chat": {
                    "briefing": "Hi! Today we'll practice handling an awkward moment in a flirty chat — light apology and recovery. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "Wait… I think you mixed up my name.",
                    "outgoing1": "Oh no — sorry! That was embarrassing. Can we start over?",
                    "incoming2Highlight": "Haha, sure",
                    "incoming2Rest": ". I'm Maya.",
                    "botReply": "No hard feelings. What were we talking about?",
                },
            },
            {
                "title": "Garip Bir Anı Kurtarmak",
                "screenplay": "Yanlış anlaşılma veya sessizlikten sonra hafifçe özür dile ve sohbeti rahat bir konuya çevir.",
                "chat": {
                    "briefing": "Merhaba! Bugün flört sohbetinde garip bir anı kurtarmayı pratik edeceğiz — hafif özür ve toparlanma. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Bir dakika… Sanırım adımı karıştırdın.",
                    "outgoing1": "Ah, özür dilerim! Çok utandım. Baştan başlayabilir miyiz?",
                    "incoming2Highlight": "Haha, tabii",
                    "incoming2Rest": ". Ben Maya.",
                    "botReply": "Sorun değil. Neyden bahsediyorduk?",
                },
            },
        ),
    },
    "directions": {
        "easy": (
            "directionsLost",
            {
                "title": "Asking for Help When You're Lost",
                "screenplay": "Admit you're lost, describe where you need to go, and confirm the directions before you leave.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking for help when you're lost. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "You look a little lost — need a hand?",
                    "outgoing1": "Yes, please. I'm trying to find City Hall.",
                    "incoming2Highlight": "Easy",
                    "incoming2Rest": " — go straight two blocks, then turn right.",
                    "botReply": "Want me to point it out on the map too?",
                },
            },
            {
                "title": "Kaybolduğunda Yardım İstemek",
                "screenplay": "Kaybolduğunu söyle, nereye gitmen gerektiğini anlat ve ayrılmadan önce yolu teyit et.",
                "chat": {
                    "briefing": "Merhaba! Bugün kaybolduğunda yardım istemeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Biraz kaybolmuş gibisin — yardım ister misin?",
                    "outgoing1": "Evet, lütfen. Belediye binasını arıyorum.",
                    "incoming2Highlight": "Kolay",
                    "incoming2Rest": " — iki blok düz git, sonra sağa dön.",
                    "botReply": "Haritada da göstereyim mi?",
                },
            },
        ),
        "medium": (
            "directionsTransit",
            {
                "title": "Asking About Bus or Subway Routes",
                "screenplay": "Ask which line to take, how many stops, and where to transfer to reach your destination.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking about bus and subway routes. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "Need transit help?",
                    "outgoing1": "Yes — which subway line goes to the museum?",
                    "incoming2Highlight": "Take the blue line",
                    "incoming2Rest": " three stops, then transfer to the green line.",
                    "botReply": "The whole trip is about twenty minutes.",
                },
            },
            {
                "title": "Otobüs veya Metro Rotası Sormak",
                "screenplay": "Hangi hatta bineceğini, kaç durak gideceğini ve nerede aktarma yapacağını sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün otobüs/metro rotası sormayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "Ulaşım konusunda yardım ister misin?",
                    "outgoing1": "Evet — müzeye hangi metro hattı gidiyor?",
                    "incoming2Highlight": "Mavi hattı al",
                    "incoming2Rest": ", üç durak git, sonra yeşil hatta aktarma yap.",
                    "botReply": "Toplam yol yaklaşık yirmi dakika sürer.",
                },
            },
        ),
        "hard": (
            "directionsWrongWay",
            {
                "title": "Correcting Wrong Directions",
                "screenplay": "Realize the directions were wrong, politely check again, and get clearer landmark-based instructions.",
                "chat": {
                    "briefing": "Hi! Today we'll practice fixing wrong directions politely. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Did you find the park?",
                    "outgoing1": "I think I went the wrong way. Could you explain it again with landmarks?",
                    "incoming2Highlight": "Of course",
                    "incoming2Rest": " — walk past the red bookstore, then left at the fountain.",
                    "botReply": "If you see the bakery, you've gone too far.",
                },
            },
            {
                "title": "Yanlış Tarifi Düzeltmek",
                "screenplay": "Yol tarifinin yanlış olduğunu fark et, kibarca tekrar sor ve yer işaretleriyle daha net tarif al.",
                "chat": {
                    "briefing": "Merhaba! Bugün yanlış tarifi kibarca düzeltmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Parkı buldun mu?",
                    "outgoing1": "Sanırım yanlış gittim. Yer işaretleriyle tekrar tarif eder misin?",
                    "incoming2Highlight": "Tabii",
                    "incoming2Rest": " — kırmızı kitabeviyi geç, çeşmede sola dön.",
                    "botReply": "Fırını görürsen fazla gitmişsin demektir.",
                },
            },
        ),
    },
    "takingTaxi": {
        "easy": (
            "taxiFare",
            {
                "title": "Asking About the Taxi Fare",
                "screenplay": "Ask for an estimate before the ride, confirm payment options, and check the final amount at the end.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking about taxi fares. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "Where to?",
                    "outgoing1": "To the airport, please. About how much will it cost?",
                    "incoming2Highlight": "Around thirty",
                    "incoming2Rest": ", depending on traffic.",
                    "botReply": "Card and cash are both fine.",
                },
            },
            {
                "title": "Taksi Ücretini Sormak",
                "screenplay": "Yolculuk öncesi tahmini sor, ödeme seçeneklerini teyit et ve sonunda tutarı kontrol et.",
                "chat": {
                    "briefing": "Merhaba! Bugün taksi ücreti sormayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Nereye?",
                    "outgoing1": "Havaalanına, lütfen. Yaklaşık ne kadar tutar?",
                    "incoming2Highlight": "Yaklaşık otuz",
                    "incoming2Rest": ", trafiğe göre değişir.",
                    "botReply": "Kart da nakit de olur.",
                },
            },
        ),
        "medium": (
            "taxiTraffic",
            {
                "title": "Talking About Traffic and Routes",
                "screenplay": "Discuss traffic, ask for a faster route, and decide whether to wait or take another way.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about traffic and alternate routes in a taxi. I'll explain first, then we'll act it out. Ready?",
                    "incoming1": "Traffic is heavy on the highway.",
                    "outgoing1": "Is there a faster route through the city?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": ", but there are more lights. It might still be quicker.",
                    "botReply": "Want me to take the city route?",
                },
            },
            {
                "title": "Trafik ve Güzergâh Konuşmak",
                "screenplay": "Trafiği konuş, daha hızlı bir yol sor ve beklemek ya da başka güzergâh seçmek arasında karar ver.",
                "chat": {
                    "briefing": "Merhaba! Bugün takside trafik ve alternatif güzergâh konuşmayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?",
                    "incoming1": "Otoyolda trafik yoğun.",
                    "outgoing1": "Şehir içinden daha hızlı bir yol var mı?",
                    "incoming2Highlight": "Var",
                    "incoming2Rest": ", ama daha çok ışık var. Yine de daha çabuk olabilir.",
                    "botReply": "Şehir içi yoldan gideyim mi?",
                },
            },
        ),
        "hard": (
            "taxiComplaint",
            {
                "title": "Handling a Taxi Problem",
                "screenplay": "Politely raise an issue — wrong route, AC, or fare — and ask for a fair solution.",
                "chat": {
                    "briefing": "Hi! Today we'll practice handling a problem in a taxi politely. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "We're almost there.",
                    "outgoing1": "Sorry, but this isn't the address I gave. Can we fix that?",
                    "incoming2Highlight": "Oh",
                    "incoming2Rest": " — my mistake. I'll turn around right away.",
                    "botReply": "Thanks for telling me. No extra charge.",
                },
            },
            {
                "title": "Taksidedeki Bir Sorunu Çözmek",
                "screenplay": "Yanlış rota, klima veya ücret gibi bir sorunu kibarca dile getir ve adil bir çözüm iste.",
                "chat": {
                    "briefing": "Merhaba! Bugün takside bir sorunu kibarca çözmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Neredeyse geldik.",
                    "outgoing1": "Kusura bakmayın ama bu verdiğim adres değil. Düzeltebilir miyiz?",
                    "incoming2Highlight": "Ah",
                    "incoming2Rest": " — benim hatam. Hemen geri dönüyorum.",
                    "botReply": "Söylediğin için teşekkürler. Ek ücret yok.",
                },
            },
        ),
    },
    "missedTrain": {
        "easy": (
            "missedTrainNext",
            {
                "title": "Finding the Next Train",
                "screenplay": "Explain you missed your train and ask when the next one leaves and which platform to use.",
                "chat": {
                    "briefing": "Hi! Today we'll practice finding the next train after missing yours. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Can I help you?",
                    "outgoing1": "I just missed the 10:15 to Boston. When's the next one?",
                    "incoming2Highlight": "Next is 10:45",
                    "incoming2Rest": " from platform 3.",
                    "botReply": "Do you need help with the ticket gate?",
                },
            },
            {
                "title": "Sonraki Treni Bulmak",
                "screenplay": "Treni kaçırdığını söyle, bir sonrakinin ne zaman kalkacağını ve hangi peronu kullanacağını sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün treni kaçırdıktan sonra sonrakini bulmayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Yardımcı olabilir miyim?",
                    "outgoing1": "Boston'a 10:15 trenini kaçırdım. Bir sonraki ne zaman?",
                    "incoming2Highlight": "Sonraki 10:45",
                    "incoming2Rest": ", 3. perondan.",
                    "botReply": "Bilet geçişinde yardım ister misin?",
                },
            },
        ),
        "medium": (
            "missedTrainTicket",
            {
                "title": "Fixing a Ticket After Missing a Train",
                "screenplay": "Ask whether your ticket is still valid, if you can board the next train, and what to do at the gate.",
                "chat": {
                    "briefing": "Hi! Today we'll practice fixing ticket issues after missing a train. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "Ticket problems?",
                    "outgoing1": "I missed my train. Is this ticket still valid for the next one?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": " for the next two hours on the same route.",
                    "botReply": "Just show it at the gate — you're fine.",
                },
            },
            {
                "title": "Tren Kaçınca Bileti Düzeltmek",
                "screenplay": "Biletinin hâlâ geçerli olup olmadığını, sonraki trene binebilip binemeyeceğini ve kapıda ne yapacağını sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün tren kaçınca bilet sorununu çözmeyi pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "Bilet sorunu mu var?",
                    "outgoing1": "Trenimi kaçırdım. Bu bilet sonraki tren için hâlâ geçerli mi?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": ", aynı güzergâhta iki saat geçerli.",
                    "botReply": "Kapıda göster — sorun olmaz.",
                },
            },
        ),
        "hard": (
            "missedTrainRefund",
            {
                "title": "Asking About Rebooking or a Refund",
                "screenplay": "Ask about rebooking, refunds, or compensation after missing a connection due to a delay.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking about rebooking or refunds after a missed train. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "How can I help?",
                    "outgoing1": "My first train was delayed and I missed the connection. Can I rebook for free?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": " — I'll put you on the next available train.",
                    "botReply": "Would you like an email confirmation too?",
                },
            },
            {
                "title": "Yeniden Bilet veya İade Sormak",
                "screenplay": "Gecikme yüzünden aktarmayı kaçırınca yeniden bilet, iade veya telafi seçeneklerini sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün tren kaçınca yeniden bilet veya iade sormayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Nasıl yardımcı olabilirim?",
                    "outgoing1": "İlk trenim gecikti, aktarmayı kaçırdım. Ücretsiz yeniden bilet alabilir miyim?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": " — sizi bir sonraki trene yazıyorum.",
                    "botReply": "E-posta onayı da ister misiniz?",
                },
            },
        ),
    },
    "freeTalkHobby": {
        "easy": (
            "freeTalkWeekend",
            {
                "title": "Talking About Weekend Plans",
                "screenplay": "Share weekend plans, ask about theirs, and suggest a simple activity you could do together.",
                "chat": {
                    "briefing": "Hi! Today we'll practice chatting about weekend plans. I'll explain first, then we'll talk. Sound good?",
                    "incoming1": "Any plans for the weekend?",
                    "outgoing1": "I might go to the park. What about you?",
                    "incoming2Highlight": "Nice",
                    "incoming2Rest": "! I was thinking of a museum.",
                    "botReply": "Want to meet for a short walk on Sunday?",
                },
            },
            {
                "title": "Hafta Sonu Planlarından Bahsetmek",
                "screenplay": "Hafta sonu planlarını anlat, onunkini sor ve birlikte yapılabilecek basit bir şey öner.",
                "chat": {
                    "briefing": "Merhaba! Bugün hafta sonu planı sohbeti pratik edeceğiz. Önce açıklayacağım, sonra konuşacağız. Olur mu?",
                    "incoming1": "Hafta sonu planın var mı?",
                    "outgoing1": "Belki parka giderim. Sen?",
                    "incoming2Highlight": "Güzel",
                    "incoming2Rest": "! Ben müzeyi düşünüyordum.",
                    "botReply": "Pazar kısa bir yürüyüş için buluşalım mı?",
                },
            },
        ),
        "medium": (
            "freeTalkMovies",
            {
                "title": "Talking About Movies",
                "screenplay": "Recommend a movie, ask about genres, and react to each other's favorites.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about movies — genres, favorites, recommendations. I'll explain first, then we'll chat. Ready?",
                    "incoming1": "Seen any good movies lately?",
                    "outgoing1": "Yes — a comedy last week. Do you like comedies?",
                    "incoming2Highlight": "Love them",
                    "incoming2Rest": "! Any titles you'd recommend?",
                    "botReply": "I'll send you my top three tonight.",
                },
            },
            {
                "title": "Filmler Hakkında Konuşmak",
                "screenplay": "Film öner, türleri sor ve birbirinizin favorilerine tepki ver.",
                "chat": {
                    "briefing": "Merhaba! Bugün film sohbeti pratik edeceğiz — türler, favoriler, öneriler. Önce açıklayacağım, sonra konuşacağız. Hazır mısın?",
                    "incoming1": "Son zamanlarda iyi film izledin mi?",
                    "outgoing1": "Evet — geçen hafta bir komedi. Sen komedi sever misin?",
                    "incoming2Highlight": "Bayılırım",
                    "incoming2Rest": "! Önereceğin bir şey var mı?",
                    "botReply": "Bu gece en iyi üçümü atarım.",
                },
            },
        ),
        "hard": (
            "freeTalkDisagree",
            {
                "title": "Politely Disagreeing About Hobbies",
                "screenplay": "Disagree politely about a hobby preference, explain your view, and keep the conversation friendly.",
                "chat": {
                    "briefing": "Hi! Today we'll practice disagreeing politely about hobbies. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "I think hiking is boring.",
                    "outgoing1": "I get that — for me it's relaxing. What do you prefer instead?",
                    "incoming2Highlight": "Fair",
                    "incoming2Rest": ". I like indoor climbing more.",
                    "botReply": "Maybe we can try each other's hobby once.",
                },
            },
            {
                "title": "Hobilerde Kibarca Aynı Fikirde Olmamak",
                "screenplay": "Bir hobi tercihine kibarca katılma, görüşünü açıkla ve sohbeti dostça sürdür.",
                "chat": {
                    "briefing": "Merhaba! Bugün hobilerde kibarca aynı fikirde olmamayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Bence yürüyüş sıkıcı.",
                    "outgoing1": "Anlıyorum — bana göre rahatlatıcı. Sen neyi tercih ediyorsun?",
                    "incoming2Highlight": "Haklısın",
                    "incoming2Rest": ". Ben kapalı alan tırmanışını daha çok severim.",
                    "botReply": "Belki bir kez birbirimizin hobisini deneriz.",
                },
            },
        ),
    },
    "interview": {
        "easy": (
            "interviewStrengths",
            {
                "title": "Talking About Your Strengths",
                "screenplay": "Describe two strengths with short examples and connect them to the job.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about your strengths in an interview. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "What would you say are your biggest strengths?",
                    "outgoing1": "I'm organized and I communicate clearly with teammates.",
                    "incoming2Highlight": "Good",
                    "incoming2Rest": ". Can you give a quick example?",
                    "botReply": "How do those strengths help in this role?",
                },
            },
            {
                "title": "Güçlü Yanlarını Anlatmak",
                "screenplay": "İki güçlü yanını kısa örneklerle anlat ve işe bağla.",
                "chat": {
                    "briefing": "Merhaba! Bugün mülakatta güçlü yanlarını anlatmayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "En güçlü yanların neler?",
                    "outgoing1": "Düzenliyim ve ekiple net iletişim kurarım.",
                    "incoming2Highlight": "Güzel",
                    "incoming2Rest": ". Kısa bir örnek verebilir misin?",
                    "botReply": "Bu güçlü yanlar bu rolde nasıl işe yarar?",
                },
            },
        ),
        "medium": (
            "interviewExperience",
            {
                "title": "Describing Work Experience",
                "screenplay": "Walk through a recent role, your responsibilities, and one achievement with numbers if possible.",
                "chat": {
                    "briefing": "Hi! Today we'll practice describing work experience clearly. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "Tell me about your most recent role.",
                    "outgoing1": "I coordinated a small team and improved our delivery time.",
                    "incoming2Highlight": "Interesting",
                    "incoming2Rest": ". By how much did you improve it?",
                    "botReply": "What was the hardest part of that job?",
                },
            },
            {
                "title": "İş Deneyimini Anlatmak",
                "screenplay": "Son rolünü, sorumluluklarını ve mümkünse rakamlı bir başarını anlat.",
                "chat": {
                    "briefing": "Merhaba! Bugün iş deneyimini net anlatmayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "En son rolünden bahseder misin?",
                    "outgoing1": "Küçük bir ekibi koordine ettim ve teslim süremizi kısalttım.",
                    "incoming2Highlight": "İlginç",
                    "incoming2Rest": ". Ne kadar kısalttınız?",
                    "botReply": "O işin en zor yanı neydi?",
                },
            },
        ),
        "hard": (
            "interviewSalary",
            {
                "title": "Discussing Salary Expectations",
                "screenplay": "Talk about salary range politely, ask about benefits, and keep the tone professional.",
                "chat": {
                    "briefing": "Hi! Today we'll practice discussing salary expectations professionally. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "What are your salary expectations for this role?",
                    "outgoing1": "I'm looking for a range around market average for this level. Could you share your band?",
                    "incoming2Highlight": "Sure",
                    "incoming2Rest": ". Benefits also include remote days and learning budget.",
                    "botReply": "Are benefits important in your decision?",
                },
            },
            {
                "title": "Maaş Beklentisini Konuşmak",
                "screenplay": "Maaş aralığını kibarca konuş, yan hakları sor ve profesyonel kal.",
                "chat": {
                    "briefing": "Merhaba! Bugün maaş beklentisini profesyonelce konuşmayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Bu rol için maaş beklentin nedir?",
                    "outgoing1": "Bu seviye için piyasa ortalamasına yakın bir aralık düşünüyorum. Sizin bandınızı paylaşabilir misiniz?",
                    "incoming2Highlight": "Tabii",
                    "incoming2Rest": ". Yan haklarda uzaktan günler ve eğitim bütçesi de var.",
                    "botReply": "Kararında yan haklar önemli mi?",
                },
            },
        ),
    },
    "doctorAppointment": {
        "easy": (
            "doctorSymptoms",
            {
                "title": "Describing Your Symptoms",
                "screenplay": "Explain what hurts, when it started, and how strong the pain is.",
                "chat": {
                    "briefing": "Hi! Today we'll practice describing symptoms at a doctor's appointment. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "What brings you in today?",
                    "outgoing1": "I've had a sore throat for three days.",
                    "incoming2Highlight": "I see",
                    "incoming2Rest": ". Any fever or cough?",
                    "botReply": "On a scale of one to ten, how bad is the pain?",
                },
            },
            {
                "title": "Şikayetlerini Anlatmak",
                "screenplay": "Nerenin ağrıdığını, ne zaman başladığını ve ağrının şiddetini anlat.",
                "chat": {
                    "briefing": "Merhaba! Bugün doktorda şikayet anlatmayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Bugün sizi ne getirdi?",
                    "outgoing1": "Üç gündür boğazım ağrıyor.",
                    "incoming2Highlight": "Anladım",
                    "incoming2Rest": ". Ateş veya öksürük var mı?",
                    "botReply": "Bir ile on arasında ağrı kaç?",
                },
            },
        ),
        "medium": (
            "doctorPrescription",
            {
                "title": "Asking About Medicine",
                "screenplay": "Ask how to take medicine, about side effects, and when to come back if it doesn't help.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking about medicine and prescriptions. I'll explain first, then we'll act it out. Ready?",
                    "incoming1": "I'm giving you this medicine twice a day.",
                    "outgoing1": "Should I take it with food? Any side effects?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": ", with food. Mild drowsiness is possible.",
                    "botReply": "If it doesn't help in three days, call us.",
                },
            },
            {
                "title": "İlaç Hakkında Sormak",
                "screenplay": "İlacı nasıl kullanacağını, yan etkileri ve işe yaramazsa ne zaman döneceğini sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün ilaç ve reçete sormayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?",
                    "incoming1": "Bu ilacı günde iki kez kullanacaksınız.",
                    "outgoing1": "Yemekle mi alayım? Yan etkisi var mı?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": ", yemekle. Hafif uyku hali olabilir.",
                    "botReply": "Üç günde geçmezse bizi arayın.",
                },
            },
        ),
        "hard": (
            "doctorFollowUp",
            {
                "title": "Talking About Test Results",
                "screenplay": "Ask what results mean, next steps, and whether you need another appointment.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about test results with a doctor. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "Your blood test results are back.",
                    "outgoing1": "What do they mean? Do I need more tests?",
                    "incoming2Highlight": "Mostly normal",
                    "incoming2Rest": ". One value is a bit high, so let's recheck in a month.",
                    "botReply": "Any questions before we finish?",
                },
            },
            {
                "title": "Test Sonuçlarını Konuşmak",
                "screenplay": "Sonuçların ne anlama geldiğini, sonraki adımları ve yeni randevu gerekip gerekmediğini sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün doktorda test sonuçlarını konuşmayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Kan tahlili sonuçlarınız geldi.",
                    "outgoing1": "Ne anlama geliyor? Daha fazla test gerekir mi?",
                    "incoming2Highlight": "Çoğu normal",
                    "incoming2Rest": ". Bir değer biraz yüksek, bir ay sonra tekrar bakalım.",
                    "botReply": "Bitirmeden sorunuz var mı?",
                },
            },
        ),
    },
    "birthdayParty": {
        "easy": (
            "birthdayInvite",
            {
                "title": "Inviting Guests to a Party",
                "screenplay": "Invite friends, share the date and place, and ask who can come.",
                "chat": {
                    "briefing": "Hi! Today we'll practice inviting guests to a birthday party. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "What's up?",
                    "outgoing1": "I'm hosting a birthday party on Saturday. Can you come?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": "! What time does it start?",
                    "botReply": "Should I bring anything?",
                },
            },
            {
                "title": "Partiye Misafir Davet Etmek",
                "screenplay": "Arkadaşlarını davet et, tarih ve yeri söyle, kimlerin gelebileceğini sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün doğum günü partisine davet etmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Ne var ne yok?",
                    "outgoing1": "Cumartesi doğum günü partisi veriyorum. Gelebilir misin?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": "! Saat kaçta başlıyor?",
                    "botReply": "Bir şey getirmemi ister misin?",
                },
            },
        ),
        "medium": (
            "birthdayGifts",
            {
                "title": "Talking About Birthday Gifts",
                "screenplay": "Discuss gift ideas, budget, and whether to buy something together.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about birthday gifts. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "What should we get for Emma?",
                    "outgoing1": "Maybe a book or headphones. What's our budget?",
                    "incoming2Highlight": "Around thirty",
                    "incoming2Rest": " each if we go together.",
                    "botReply": "Want to shop online or in store?",
                },
            },
            {
                "title": "Doğum Günü Hediyesi Konuşmak",
                "screenplay": "Hediye fikirlerini, bütçeyi ve birlikte alıp almayacağınızı konuş.",
                "chat": {
                    "briefing": "Merhaba! Bugün doğum günü hediyesi konuşmayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "Emma'ya ne alalım?",
                    "outgoing1": "Belki kitap veya kulaklık. Bütçemiz ne kadar?",
                    "incoming2Highlight": "Yaklaşık otuz",
                    "incoming2Rest": " kişi başı, birlikte alırsak.",
                    "botReply": "Online mı yoksa mağazadan mı bakalım?",
                },
            },
        ),
        "hard": (
            "birthdaySurprise",
            {
                "title": "Planning a Surprise Party",
                "screenplay": "Keep the surprise secret, assign tasks, and handle last-minute changes without spoiling it.",
                "chat": {
                    "briefing": "Hi! Today we'll practice planning a surprise party without spoiling it. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Is everything ready for the surprise?",
                    "outgoing1": "Almost — can you distract her until 7?",
                    "incoming2Highlight": "Got it",
                    "incoming2Rest": ". What if she finishes work early?",
                    "botReply": "Text me and I'll stall with coffee.",
                },
            },
            {
                "title": "Sürpriz Parti Planlamak",
                "screenplay": "Sürprizi gizli tut, görevleri dağıt ve bozmadan son dakika değişikliklerini yönet.",
                "chat": {
                    "briefing": "Merhaba! Bugün sürprizi bozmadan parti planlamayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Sürpriz için her şey hazır mı?",
                    "outgoing1": "Neredeyse — onu 7'ye kadar oyalayabilir misin?",
                    "incoming2Highlight": "Tamam",
                    "incoming2Rest": ". İşten erken çıkarsa ne olacak?",
                    "botReply": "Yaz bana, ben kahveyle oyalarım.",
                },
            },
        ),
    },
    "rentingApartment": {
        "easy": (
            "rentingApartmentTour",
            {
                "title": "Talking About the Apartment on a Tour",
                "screenplay": "Ask about rooms, sunlight, noise, appliances, and whether furniture is included during a viewing.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about an apartment during a viewing. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "Here's the living room — what do you think?",
                    "outgoing1": "It's nice. Does it get much sunlight in the afternoon?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": ", especially from these windows.",
                    "botReply": "Want to see the kitchen and balcony next?",
                },
            },
            {
                "title": "Daire Hakkında Konuşmak",
                "screenplay": "Görüntüleme sırasında oda, ışık, gürültü, eşya ve mobilyanın dahil olup olmadığını sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün daire gezisinde daire hakkında konuşmayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Burası salon — ne dersiniz?",
                    "outgoing1": "Güzel. Öğleden sonra güneş alıyor mu?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": ", özellikle bu pencerelerden.",
                    "botReply": "Sırada mutfak ve balkonu görelim mi?",
                },
            },
        ),
        "medium": (
            "rentingApartmentAgent",
            {
                "title": "Talking with a Real Estate Agent",
                "screenplay": "Talk to an agent about budget, location, lease length, and which listings match your needs.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking with a real estate agent about rentals. I'll explain first, then we'll act it out. Ready?",
                    "incoming1": "What kind of apartment are you looking for?",
                    "outgoing1": "A one-bedroom near the subway, under twelve hundred a month.",
                    "incoming2Highlight": "Perfect",
                    "incoming2Rest": ". I have three options in that range.",
                    "botReply": "Do you prefer furnished or unfurnished?",
                },
            },
            {
                "title": "Emlakçı ile Konuşmak",
                "screenplay": "Emlakçıyla bütçe, konum, sözleşme süresi ve ihtiyacına uyan ilanları konuş.",
                "chat": {
                    "briefing": "Merhaba! Bugün emlakçıyla kiralık daire konuşmayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?",
                    "incoming1": "Nasıl bir daire arıyorsunuz?",
                    "outgoing1": "Metroya yakın, aylık bin iki yüzün altında bir oda bir salon.",
                    "incoming2Highlight": "Harika",
                    "incoming2Rest": ". O aralıkta üç seçeneğim var.",
                    "botReply": "Eşyalı mı yoksa eşyasız mı tercih edersiniz?",
                },
            },
        ),
        "hard": (
            "rentingApartmentNegotiate",
            {
                "title": "Negotiating Rent and Lease Terms",
                "screenplay": "Negotiate rent, deposit, move-in date, and pet policy politely while staying clear about your limits.",
                "chat": {
                    "briefing": "Hi! Today we'll practice negotiating rent and lease terms. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "The rent is thirteen hundred plus utilities.",
                    "outgoing1": "Could you do twelve fifty if I sign a longer lease?",
                    "incoming2Highlight": "Possibly",
                    "incoming2Rest": " for a 18-month lease. Deposit is still one month.",
                    "botReply": "Are pets allowed with an extra fee?",
                },
            },
            {
                "title": "Kira ve Sözleşme Pazarlığı",
                "screenplay": "Kirayı, depozitoyu, taşınma tarihini ve evcil hayvan kuralını kibarca pazarlık et; sınırlarını net tut.",
                "chat": {
                    "briefing": "Merhaba! Bugün kira ve sözleşme şartlarını pazarlık etmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Kira bin üç yüz artı faturalar.",
                    "outgoing1": "Daha uzun sözleşme imzalarsam bin iki yüz elli olur mu?",
                    "incoming2Highlight": "Belki",
                    "incoming2Rest": ", 18 aylık sözleşmede. Depozito yine bir aylık.",
                    "botReply": "Ek ücretle evcil hayvan olur mu?",
                },
            },
        ),
    },
    "restaurantReservation": {
        "easy": (
            "restaurantChange",
            {
                "title": "Changing a Restaurant Reservation",
                "screenplay": "Call to change the time or party size and confirm the new details.",
                "chat": {
                    "briefing": "Hi! Today we'll practice changing a restaurant reservation. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Reservation desk, how can I help?",
                    "outgoing1": "I have a booking for 7. Can we move it to 8 for four people?",
                    "incoming2Highlight": "Sure",
                    "incoming2Rest": ", 8 pm for four is available.",
                    "botReply": "I'll text you the confirmation.",
                },
            },
            {
                "title": "Restoran Rezervasyonunu Değiştirmek",
                "screenplay": "Saati veya kişi sayısını değiştirmek için ara ve yeni bilgileri teyit et.",
                "chat": {
                    "briefing": "Merhaba! Bugün restoran rezervasyonunu değiştirmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Rezervasyon, buyurun?",
                    "outgoing1": "Saat 7 için rezervasyonum var. 8'e, dört kişilik alabilir miyiz?",
                    "incoming2Highlight": "Tabii",
                    "incoming2Rest": ", saat 8 dört kişilik müsait.",
                    "botReply": "Onayı mesajla göndereceğim.",
                },
            },
        ),
        "medium": (
            "restaurantAllergy",
            {
                "title": "Talking About Food Allergies",
                "screenplay": "Explain allergies or diet needs, ask what's safe on the menu, and confirm with the staff.",
                "chat": {
                    "briefing": "Hi! Today we'll practice talking about food allergies at a restaurant. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "Any allergies we should know about?",
                    "outgoing1": "Yes — I'm allergic to peanuts. Which dishes are safe?",
                    "incoming2Highlight": "Most pasta dishes",
                    "incoming2Rest": " are fine. I'll flag it for the kitchen.",
                    "botReply": "Would you like the chef's recommendation?",
                },
            },
            {
                "title": "Yiyecek Alerjisini Belirtmek",
                "screenplay": "Alerji veya diyet ihtiyacını anlat, menüde güvenli olanı sor ve personele teyit ettir.",
                "chat": {
                    "briefing": "Merhaba! Bugün restoranda yiyecek alerjisini anlatmayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "Bilmemiz gereken bir alerjiniz var mı?",
                    "outgoing1": "Evet — fıstığa alerjim var. Hangi yemekler güvenli?",
                    "incoming2Highlight": "Çoğu makarna",
                    "incoming2Rest": " sorun olmaz. Mutfağa not düşeceğim.",
                    "botReply": "Şefin önerisini ister misiniz?",
                },
            },
        ),
        "hard": (
            "restaurantComplaint",
            {
                "title": "Complaining Politely at a Restaurant",
                "screenplay": "Explain a problem with food or service calmly and ask for a fair fix.",
                "chat": {
                    "briefing": "Hi! Today we'll practice complaining politely at a restaurant. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Is everything alright with your meal?",
                    "outgoing1": "The pasta is cold. Could you remake it, please?",
                    "incoming2Highlight": "I'm sorry",
                    "incoming2Rest": " — we'll remake it right away.",
                    "botReply": "Would you like a drink while you wait?",
                },
            },
            {
                "title": "Restoranda Kibarca Şikâyet Etmek",
                "screenplay": "Yemek veya servis sorununu sakin anlat ve adil bir çözüm iste.",
                "chat": {
                    "briefing": "Merhaba! Bugün restoranda kibarca şikâyet etmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Yemeğiniz yolunda mı?",
                    "outgoing1": "Makarna soğuk. Yeniden yapabilir misiniz, lütfen?",
                    "incoming2Highlight": "Özür dilerim",
                    "incoming2Rest": " — hemen yeniden yapıyoruz.",
                    "botReply": "Beklerken bir içecek ister misiniz?",
                },
            },
        ),
    },
    "flightAttendant": {
        "easy": (
            "flightSeat",
            {
                "title": "Asking to Change Seats",
                "screenplay": "Politely ask if you can switch seats for comfort, family, or a window/aisle preference.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking a flight attendant to change seats. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "Need anything before takeoff?",
                    "outgoing1": "Could I move to an aisle seat if one is free?",
                    "incoming2Highlight": "Let me check",
                    "incoming2Rest": "… yes, 14C is open.",
                    "botReply": "I'll move your bag tag too.",
                },
            },
            {
                "title": "Koltuk Değişikliği İstemek",
                "screenplay": "Rahatlık, aile veya cam/koridor tercihi için kibarca koltuk değişimi iste.",
                "chat": {
                    "briefing": "Merhaba! Bugün kabin görevlisinden koltuk değişikliği istemeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Kalkıştan önce bir şey ister misiniz?",
                    "outgoing1": "Boşsa koridor tarafına geçebilir miyim?",
                    "incoming2Highlight": "Bakayım",
                    "incoming2Rest": "… evet, 14C boş.",
                    "botReply": "Bagaj etiketini de taşıyorum.",
                },
            },
        ),
        "medium": (
            "flightSpecialMeal",
            {
                "title": "Asking for a Special Meal",
                "screenplay": "Ask about meal options, request vegetarian or other special meals, and confirm timing.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking for a special meal on a flight. I'll explain first, then we'll act it out. Ready?",
                    "incoming1": "We're serving dinner soon.",
                    "outgoing1": "Do you have a vegetarian option?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": " — pasta or salad box.",
                    "botReply": "I'll bring it with the next cart.",
                },
            },
            {
                "title": "Özel Yemek İstemek",
                "screenplay": "Yemek seçeneklerini sor, vejetaryen veya özel yemek iste ve zamanını teyit et.",
                "chat": {
                    "briefing": "Merhaba! Bugün uçakta özel yemek istemeyi pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?",
                    "incoming1": "Yakında akşam yemeği servisi var.",
                    "outgoing1": "Vejetaryen seçenek var mı?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": " — makarna veya salata kutusu.",
                    "botReply": "Bir sonraki arabayla getireceğim.",
                },
            },
        ),
        "hard": (
            "flightDelay",
            {
                "title": "Asking About a Delay or Connection",
                "screenplay": "Ask why the flight is delayed, whether you'll make a connection, and what help is available.",
                "chat": {
                    "briefing": "Hi! Today we'll practice asking about delays and connections on a flight. I'll explain first, then we'll role-play. Sound good?",
                    "incoming1": "We'll be delayed about forty minutes.",
                    "outgoing1": "I have a tight connection. Will I still make it?",
                    "incoming2Highlight": "We'll try",
                    "incoming2Rest": ". I'll radio ahead if needed.",
                    "botReply": "Do you need gate information for the next flight?",
                },
            },
            {
                "title": "Gecikme veya Aktarma Sormak",
                "screenplay": "Uçuş neden geciktiğini, aktarmaya yetişip yetişmeyeceğini ve ne yardım olduğunu sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün uçuşta gecikme ve aktarma sormayı pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Olur mu?",
                    "incoming1": "Yaklaşık kırk dakika gecikeceğiz.",
                    "outgoing1": "Aktarmam çok sıkışık. Yetişir miyim?",
                    "incoming2Highlight": "Deneyeceğiz",
                    "incoming2Rest": ". Gerekirse önceden haber veririz.",
                    "botReply": "Sonraki uçuşun kapı bilgisini ister misiniz?",
                },
            },
        ),
    },
    "trainTicket": {
        "easy": (
            "trainTicketChange",
            {
                "title": "Changing Your Train Ticket Time",
                "screenplay": "Ask to change departure time, check fees, and confirm the new ticket.",
                "chat": {
                    "briefing": "Hi! Today we'll practice changing a train ticket time. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Ticket desk — how can I help?",
                    "outgoing1": "Can I change my 3 pm ticket to the 5 pm train?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": ", with a small change fee.",
                    "botReply": "I'll print the updated ticket now.",
                },
            },
            {
                "title": "Tren Bileti Saatini Değiştirmek",
                "screenplay": "Kalkış saatini değiştirmek iste, ücreti sor ve yeni bileti teyit et.",
                "chat": {
                    "briefing": "Merhaba! Bugün tren bileti saatini değiştirmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Bilet gişesi — buyurun?",
                    "outgoing1": "Saat 3 biletini 5 trenine çevirebilir miyim?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": ", küçük bir değişiklik ücreti var.",
                    "botReply": "Güncel bileti şimdi basıyorum.",
                },
            },
        ),
        "medium": (
            "trainTicketPlatform",
            {
                "title": "Finding the Right Platform",
                "screenplay": "Ask which platform your train leaves from and how to get there with luggage.",
                "chat": {
                    "briefing": "Hi! Today we'll practice finding the right train platform. I'll explain first, then we'll act it out. Sound good?",
                    "incoming1": "Looking for your platform?",
                    "outgoing1": "Yes — the train to Chicago. Which platform is it?",
                    "incoming2Highlight": "Platform 7",
                    "incoming2Rest": ". Elevators are on the left.",
                    "botReply": "Boarding starts in ten minutes.",
                },
            },
            {
                "title": "Doğru Peronu Bulmak",
                "screenplay": "Treninin hangi perondan kalktığını ve bagajla nasıl gideceğini sor.",
                "chat": {
                    "briefing": "Merhaba! Bugün doğru tren peronunu bulmayı pratik edeceğiz. Önce açıklayacağım, sonra canlandıracağız. Olur mu?",
                    "incoming1": "Peronunu mu arıyorsun?",
                    "outgoing1": "Evet — Chicago treni. Hangi peron?",
                    "incoming2Highlight": "Peron 7",
                    "incoming2Rest": ". Asansörler solda.",
                    "botReply": "Biniş on dakika içinde başlıyor.",
                },
            },
        ),
        "hard": (
            "trainTicketUpgrade",
            {
                "title": "Upgrading Your Seat or Class",
                "screenplay": "Ask about upgrading to quiet car or first class, compare prices, and complete the change.",
                "chat": {
                    "briefing": "Hi! Today we'll practice upgrading a train seat or class. I'll explain first, then we'll role-play. Ready?",
                    "incoming1": "Need help with your ticket?",
                    "outgoing1": "Can I upgrade to first class on this train?",
                    "incoming2Highlight": "Yes",
                    "incoming2Rest": " — seats are open for an extra forty dollars.",
                    "botReply": "Quiet car is cheaper if you prefer that.",
                },
            },
            {
                "title": "Koltuk veya Sınıf Yükseltmek",
                "screenplay": "Sessiz vagon veya birinci sınıfa yükseltmeyi sor, fiyatları karşılaştır ve değişikliği tamamla.",
                "chat": {
                    "briefing": "Merhaba! Bugün tren koltuğu veya sınıf yükseltmeyi pratik edeceğiz. Önce açıklayacağım, sonra rol yapacağız. Hazır mısın?",
                    "incoming1": "Biletiniz için yardım ister misiniz?",
                    "outgoing1": "Bu trende birinci sınıfa yükseltebilir miyim?",
                    "incoming2Highlight": "Evet",
                    "incoming2Rest": " — kırk dolar farkla yer var.",
                    "botReply": "Sessiz vagon daha uygun, isterseniz.",
                },
            },
        ),
    },
}


def inject(path: Path, locale: str) -> None:
    data = json.loads(path.read_text(encoding="utf-8"))
    rp = data.get("rolePlayPage")
    if not isinstance(rp, dict):
        print(f"skip {path}: no rolePlayPage")
        return

    added = 0
    for base, levels in VARIANTS.items():
        for level_key, (key, en_block, tr_block) in levels.items():
            if key in rp:
                continue
            block = tr_block if locale == "tr" else en_block
            # Insert after base key if present, else append
            if base in rp:
                new_rp = {}
                for k, v in rp.items():
                    new_rp[k] = v
                    if k == base:
                        # also keep existing coffee* siblings order loosely
                        new_rp[key] = block
                        added += 1
                rp = new_rp
            else:
                rp[key] = block
                added += 1

    data["rolePlayPage"] = rp
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"{path.name}: +{added} keys")


def main() -> None:
    for path in sorted(ROOT.glob("*.i18n.json")):
        locale = path.name.split(".")[0]
        inject(path, locale)


if __name__ == "__main__":
    main()
