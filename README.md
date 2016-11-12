# 設定
application.env.templateをコピーして、application.envファイルを作成してください。  
各項目に情報を入力し、.bash_profileより環境設定ファイルを読み込ますための記述をします。  

.bash_profile
```
source <app_path>/bin/application.env
```

.bash_profileを読み込みます。
`$ source .bash_profile`
