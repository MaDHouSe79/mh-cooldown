local Translations = {
    ['cooldown_active'] = "Le temps de recharge est actif!",
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
    fallbackLang = Lang,
})