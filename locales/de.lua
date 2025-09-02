local Translations = {
    ['cooldown_active'] = "Abkühlung ist aktiv!",
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
    fallbackLang = Lang,
})