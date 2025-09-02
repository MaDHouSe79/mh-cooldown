local Translations = {
    ['cooldown_active'] = "Il raffreddamento è attivo!",
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
    fallbackLang = Lang,
})