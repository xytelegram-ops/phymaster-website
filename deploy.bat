@echo off
echo ==============================
echo  Deploy to GitHub
echo ==============================
echo.

:: 设置变量
set REPO_DIR=%USERPROFILE%\phymaster-website
set SOURCE_DIR=%USERPROFILE%\Desktop\网站

:: 检查目标目录是否存在
if exist "%REPO_DIR%" (
    echo [1/4] 仓库目录已存在：%REPO_DIR%
) else (
    echo [1/4] 正在克隆仓库...
    cd /d %USERPROFILE%
    git clone https://xytelegram-ops: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@github.com/xytelegram-ops/phymaster-website.git
    if errorlevel 1 (
        echo 克隆失败，请检查网络或 Token 权限
        pause
        exit /b 1
    )
)

:: 复制文件
echo [2/4] 正在复制文件到仓库...
copy /Y "%SOURCE_DIR%\index.html" "%REPO_DIR%\index.html"
copy /Y "%SOURCE_DIR%\qr-code.jpg" "%REPO_DIR%\qr-code.jpg"
echo 完成！

:: 提交
echo [3/4] 正在提交...
cd /d "%REPO_DIR%"
git add .
git commit -m "更新个人网站 - 物理学研究生 AI 研究主页"

:: 推送
echo [4/4] 正在推送到 GitHub...
git push
if errorlevel 1 (
    echo 推送失败，请检查网络连接
    pause
    exit /b 1
)

echo.
echo ==============================
echo  部署成功！
echo ==============================
echo  网站地址: https://xytelegram-ops.github.io/phymaster-website/
pause
