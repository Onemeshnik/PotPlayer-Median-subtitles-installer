[Setup]
AppId={{88A7F91A-5877-40A1-89B0-009D9AD174EA}
AppName=PotPlayer Median Subtitles 64 mod
AppVerName=PotPlayer Median Subtitles 64 mod portable
AppVersion=Portable
AppPublisher=Dreamject
DefaultDirName={sd}\Prog\PotPlayer Median Subtitles 64
OutputBaseFilename=PotPlayer Median Subtitles 64
Compression=lzma2/ultra64
SolidCompression=true
DisableProgramGroupPage=yes
AllowNoIcons=yes
WizardImageFile=embedded\WizardImage0.bmp
WizardSmallImageFile=embedded\WizardSmallImage0.bmp
DisableReadyPage=True
DisableReadyMemo=True
AppCopyright=Dreamject
CompressionThreads=8
UsePreviousLanguage=False

DisableDirPage=no
ShowLanguageDialog=auto
SetupIconFile=Ico11.ico
AllowRootDirectory=True
Uninstallable=yes
InternalCompressLevel=ultra64
AlwaysShowDirOnReadyPage=True
EnableDirDoesntExistWarning=True
UninstallDisplayName=PotPlayer Median Subtitles 64
UninstallDisplayIcon={uninstallexe}

[Files]
;Source: "{tmp}\Splash.bmp"; DestDir: "{tmp}"; MinVersion: 0.0,5.0; Flags: deleteafterinstall dontcopy
;Source: "{tmp}\WizardImage1.bmp"; DestDir: "{tmp}"; MinVersion: 0.0,5.0; Flags: deleteafterinstall dontcopy
Source: "{tmp}\WizardImage2.bmp"; DestDir: "{tmp}"; Flags: deleteafterinstall dontcopy; MinVersion: 0.0,5.0
;Source: "{tmp}\SetupImage1.bmp"; DestDir: "{tmp}"; MinVersion: 0.0,5.0; Flags: deleteafterinstall dontcopy
Source: "{tmp}\SetupImage2.bmp"; DestDir: "{tmp}"; Flags: deleteafterinstall dontcopy; MinVersion: 0.0,5.0
;Source: "{app}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{app}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist promptifolder
Source: "{app}\desktop.ini"; DestDir: "{app}"; Attribs: hidden system

[Run]
Filename: "{app}\PotPlayerMini64.exe"; Parameters: "/RegisterAll"; WorkingDir: "{app}"; Flags: nowait postinstall; Description: "Зарегистрировать PotPlayer в системе"
Filename: "{app}\!Обсудить сборку в беседе VK.url"; Flags: postinstall nowait shellexec unchecked; Description: "Обсудить сборку в ВК"
Filename: "{app}\!Отключение слежки + readme.txt"; Flags: postinstall nowait shellexec; Description: "Изменения в сборке, отключение слежки и тд"
Filename: "{app}\PotPlayerMini64.exe"; Flags: postinstall nowait shellexec; Description: "Запустить PotPlayer"

[Icons]
Name: "{userstartmenu}\PotPlayer Median Subtitles 64"; Filename: "{app}\PotPlayerMini64.exe"; Comment: "The best media player from South Korea."; Tasks: groupicon
Name: "{userdesktop}\PotPlayer Median Subtitles 64"; Filename: "{app}\PotPlayerMini64.exe"; Comment: "The best media player from South Korea."; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\PotPlayer Median Subtitles 64"; Filename: "{app}\PotPlayerMini64.exe"; Tasks: quicklaunchicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\PotPlayer Median Subtitles 64"; Filename: "{app}\PotPlayerMini64.exe"; Tasks: quicklaunchicon

[Tasks]
Name: "quicklaunchicon"; Description: "Создать иконку на панели быстрого запуска"
Name: "groupicon"; Description: "В меню Пуск"
Name: "desktopicon"; Description: "Создать иконку на рабочем столе"

[CustomMessages]
en.NameAndVersion=%1 version %2
en.AdditionalIcons=Additional shortcuts:
en.CreateDesktopIcon=Create a &desktop shortcut
en.CreateQuickLaunchIcon=Create a &Quick Launch shortcut
en.ProgramOnTheWeb=%1 on the Web
en.UninstallProgram=Uninstall %1
en.LaunchProgram=Launch %1
en.AssocFileExtension=&Associate %1 with the %2 file extension
en.AssocingFileExtension=Associating %1 with the %2 file extension...
en.AutoStartProgramGroupDescription=Startup:
en.AutoStartProgram=Automatically start %1
en.AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?
ru.NameAndVersion=%1, версия %2
ru.AdditionalIcons=Ярлыки:
ru.CreateDesktopIcon=Создать ярлык на &рабочем столе
ru.CreateQuickLaunchIcon=Создать ярлык в &панели быстрого запуска
ru.ProgramOnTheWeb=Сайт %1 в Интернете
ru.UninstallProgram=Удалить %1
ru.LaunchProgram=Запустить %1
ru.AssocFileExtension=Св&язать %1 с файлами, имеющими расширение %2
ru.AssocingFileExtension=Связывание %1 с файлами %2 ...
ru.AutoStartProgramGroupDescription=Автозапуск:
ru.AutoStartProgram=Автоматически запускать %1
ru.AddonHostProgramNotFound=%1 не найден в указанной вами папке.%n%nВы всё равно хотите продолжить?
en.progress=Progress:
en.acesetup=Installation Ace Stream Engine...
en.endsetup=PotPlayer was successfully installed on your computer!%n%nRun PotPlayer?
en.SetupImageHint=Previous player icon
en.HeaderLabel1=Select installation type:
en.SetupCaption1= Default
en.SetupCaption2= Portable
en.HeaderLabel2=Additionally:
en.SetupCaption3= Viewing videos with the effect of smooth movements (SVP)
en.SetupCaption4= Viewing videos from torrent trackers (LibTorrent)
en.SetupCaption5= Viewing Torrent-TV (Installation Ace Stream Engine)
en.SetupCaption6= Create a desktop shortcut
en.SetupCaption0= Delete previous settings (Presets, Hotkeys, Favorites...)
en.group1=Integration:
en.filetypes=Associations
en.filetypes0video=Video
en.filetypes0audio=Audio
en.filetypes0sub=Subtitles
en.filetypes0pls=Playlists
en.autoplay=AutoPlay
en.context=Add to file and folder context menu
en.iconpack=Add icon libraries for media files
en.screensaver=Add a PotPlayer screen saver
en.minfo=Add MediaInfo to file context menu
en.group2=Skins:
en.skin1='DEFAULT'
en.skin2='POTXMP'
en.skin3='SPLASH'
en.skin4='FMOD'
en.skin5='POTKMP'
en.skin6='POTMBE.WF'
en.skinmenu=Color menu in skin style
en.skinfix=Use a fixed size of skins
en.skinsize=Keep window size while switching between skin modes
en.set13=Window in the center of the screen at startup
en.group3=Playlists, Images, Audio, Video:
en.savedocs=Save in the folder '...\Documents\PotPlayer'
en.savedef=Save to user profile
en.addplaylist=Add self-updating playlists (IPTV etc.)
en.group4=Player:
en.set1=Add all files of the same type to playlist
en.set101=Do not clear playlist when adding new files
en.set2=Add only selected files to playlist
en.set201=Clear playlist when the player is closed
en.set3=Store and show recent items in 'Album/Favorites' menu
en.set4=Remember video playback positions
en.set5=Pause playback when minimized
en.set6=Minimized to tray
en.set7=Window by video size during playback
en.set701=Window in the center of the screen
en.set702=Keep aspect ratio when changing the window
en.set8=Show thumbnail previews on navigation bar
en.set9=Show markers bookmark/chapter on navigation bar
en.set10=Show tray icon
en.set14=Enable enhanced taskbar features
en.set11=The default action for mouse buttons
en.set12=Allow more than one PotPlayer instance
en.group5=Subtitles:
en.sub=Show subtitles
en.subload=Load subtitles with any name
en.subsave=Remember subtitle track selections
en.group6=Preferred languages:
en.group7=Video:
en.dxva=Use hardware decoders (DXVA)
en.dxva0cuqs=Add QuickSync/CUDA decoders
en.dxva0cuda=Add CUDA decoders
en.mvc=Add H.264 MVC (SW) decoder
en.hwvideo=Use hardware color controls
en.group8=Audio:
en.gain=Normalizer
en.gain0v=Operate only with video playback
en.audext=Auto load external audio files
en.audsave=Remember audio track selections
en.group9=Preferred languages:
en.group10=Output speakers:
en.stereo=Stereo (2.0)
en.ch6=Multichannel (5.1)
en.asis=Same as input (Sound card mixer)
en.wasapi=Use built-in audio renderer (WASAPI) 
en.PlayPlayer=Play with PotPlayer
en.AddPlayer=Add to PotPlayer Playlist
en.PlayDVD=DVD playback
en.PlayBD=Blu-ray playback
en.Playlist=Playlist
en.Audio=Audio
en.Video=Video
en.Subtitles=Subtitles
en.AudioOpen=Audio
en.VideoOpen=Video
en.PlaylistOpen=Playlist
ru.progress=Прогресс:
ru.acesetup=Установка Ace Stream Engine...
ru.endsetup=PotPlayer был успешно установлен на Ваш компьютер!%n%nЗапустить PotPlayer?
ru.SetupImageHint=Предыдущий значок проигрывателя
ru.HeaderLabel1=Выберите тип установки:
ru.SetupCaption1= Стандартная установка
ru.SetupCaption2= Распаковка портативной версии
ru.HeaderLabel2=Дополнительно:
ru.SetupCaption3= Просмотр видео с эффектом плавности движений (SVP)
ru.SetupCaption4= Просмотр видео с торрент-трекеров (LibTorrent)
ru.SetupCaption5= Просмотр Торрент-ТВ (Установка Ace Stream Engine)
ru.SetupCaption6= Создать ярлык на рабочем столе
ru.SetupCaption0= Удалить предыдущие настройки (Профили, Клавиши, Избранное...)
ru.group1=Интеграция:
ru.filetypes=Ассоциации
ru.filetypes0video=Видео
ru.filetypes0audio=Аудио
ru.filetypes0sub=Субтитры
ru.filetypes0pls=Списки
ru.autoplay=Автозапуск
ru.context=Добавить в контекстное меню файлов и папок
ru.iconpack=Добавить библиотеки значков для медиафайлов
ru.screensaver=Добавить экранную заставку PotPlayer
ru.minfo=Добавить MediaInfo в контекстное меню файлов
ru.group2=Обложки:
ru.skin1='DEFAULT'
ru.skin2='POTXMP'
ru.skin3='SPLASH'
ru.skin4='FMOD'
ru.skin5='POTKMP'
ru.skin6='POTMBE.WF'
ru.skinmenu=Цвет меню проигрывателя в стиле обложек
ru.skinfix=Использовать фиксированный размер обложек
ru.skinsize=Одинаковый размер для всех режимов обложки
ru.set13=Окно в центре экрана при запуске проигрывателя
ru.group3=Списки, Изображения, Аудио, Видео:
ru.savedocs=Сохранять в папке '...\Документы\PotPlayer'
ru.savedef=Сохранять в профиле пользователя
ru.addplaylist=Добавить самообновляемые списки воспроизведения (IPTV etc.)
ru.group4=Проигрыватель:
ru.set1=Добавлять в основной список все файлы
ru.set101=Не очищать список при добавлении новых файлов
ru.set2=Добавлять в основной список только выделенные файлы
ru.set201=Очищать список при закрытии проигрывателя
ru.set3=Список последних файлов в меню 'Избранное'
ru.set4=Воспроизведение видео с момента остановки
ru.set5=Ставить видео на паузу при сворачивании
ru.set6=Сворачивать окно проигрывателя в область уведомлений
ru.set7=Окно проигрывателя по размеру видео при воспроизведении
ru.set701=Oкно в центрe экрана при воспроизведении
ru.set702=Сохранять соотношение сторон при изменении окна
ru.set8=Предпросмотр видео на панели навигации
ru.set9=Маркеры закладок и глав на панели навигации
ru.set10=Показывать значок проигрывателя в области уведомлений
ru.set14=Кнопки управления в значке проигрывателя на панели задач
ru.set11=Действие по умолчанию для кнопок мыши
ru.set12=Разрешить запуск нескольких копий проигрывателя
ru.group5=Субтитры:
ru.sub=Включить субтитры
ru.subload=Подключать субтитры с любым именем
ru.subsave=Запоминать выбор субтитров в файлах
ru.group6=Предпочитаемый язык субтитров:
ru.group7=Видео:
ru.dxva=Использовать аппаратные декодеры (DXVA)
ru.dxva0cuqs=Добавить QuickSync/CUDA декодеры
ru.dxva0cuda=Добавить CUDA декодеры
ru.mvc=Добавить H.264 MVC (SW) декодер
ru.hwvideo=Использовать аппаратное управление цветом
ru.group8=Аудио:
ru.gain=Использовать фильтр нормализации громкости
ru.gain0v=Только при воспроизведении видео
ru.audext=Подключать внешние аудиодорожки
ru.audsave=Запоминать выбор аудиодорожки в файлах
ru.group9=Предпочитаемый язык аудиодорожки:
ru.group10=Вывод аудио:
ru.stereo=Стерео (2.0)
ru.ch6=Многоканальный (5.1)
ru.asis=Не менять (Микшер Windows)
ru.wasapi=Встроенный рендер аудио (WASAPI)
ru.PlayPlayer=Воспроизвести в PotPlayer
ru.AddPlayer=Добавить в PotPlayer
ru.PlayDVD=Воспроизведение DVD
ru.PlayBD=Воспроизведение Blu-ray
ru.Playlist=Список
ru.Audio=Аудио
ru.Video=Видео
ru.Subtitles=Субтитры
ru.AudioOpen=Аудио
ru.VideoOpen=Видео
ru.PlaylistOpen=Списки воспроизведения

[Languages]

Name: "ru"; MessagesFile: "embedded\ru.isl";
Name: "en"; MessagesFile: "embedded\en.isl";

[LangOptions]
DialogFontName=Tahoma
DialogFontSize=11
WelcomeFontSize=13
CopyrightFontSize=12

[PreCompile]
Name: "prog2app.bat"
Name: "{app}\zcleaner.bat"

[PostCompile]
Name: "app2prog.bat"
