### Автоматизована перевірка норм кодування програмного коду

У цьому розділі виконано автоматизацію конвеєра CI з використанням
**GitHub Actions**: перевірку версій програмного забезпечення (`Node.js` —
рівень обробки даних, `PostgreSQL` — рівень доступу даних), автоматичну
перевірку норм кодування схеми даних (`DataSchema.sql`, утиліта `sqlfluff`)
та автоматичну перевірку норм кодування програмного модуля (`ProgramCode.js`,
`Biome`).

Оскільки навчальний репозиторій `private`, а можливості `GitHub Actions`
безкоштовно доступні лише для `public`-репозиторіїв, усі сценарії спершу
виконано в окремому допоміжному `public`-репозиторії на власному
`GitHub`-акаунті, а результати (файли `*.yml` та знімки екранів `*.jpg`)
перенесено сюди.

#### Склад розділу

- `PrintSoftwareVersions.yml` — сценарій перевірки версій ПЗ (дві роботи:
  `PrintLanguageVersions`, `PrintDBMSVersions`);
- `PrintSoftwareVersionsResult.jpg` — результат виконання першої роботи
  (версія `Node.js`);
- `PrintDBMSVersionsResult.jpg` — результат виконання другої роботи
  (версія `PostgreSQL`);
- `DataSchemaCodeConvention.yml` — сценарій перевірки норм кодування схеми
  даних утилітою `sqlfluff`;
- `DataSchema.sql` — фізична схема бази даних (розділ `2.4-PhysicalSchema`);
- `DataSchemaCodeConventionResult.jpg` — результат перевірки (без порушень);
- `DataSchemaModified.sql` — навмисно змінена схема з порушеннями норм
  кодування;
- `DataSchemaModifiedCodeConventionResult.jpg` — результат перевірки
  зміненої схеми (з порушеннями);
- `ProgramCodeConvention.yml` — сценарій перевірки норм кодування програмного
  модуля утилітою `Biome`;
- `ProgramCode.js` — програмний модуль мовою `JavaScript` (`Node.js`),
  визначеною архітектурним стилем з лабораторної роботи №2;
- `ProgramCodeConventionResult.jpg` — результат перевірки (без порушень);
- `ProgramCodeModified.js` — навмисно змінений код з порушеннями норм
  кодування;
- `ProgramCodeModifiedCodeConventionResult.jpg` — результат перевірки
  зміненого коду (з порушеннями).
