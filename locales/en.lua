local Translations = {
    ['cooldown_active'] = "Cooldown is active!",
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
    fallbackLang = Lang,
})