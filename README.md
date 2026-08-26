# 留学申请多人协作看板

一个可部署到 GitHub Pages 的美国、英国、新加坡大学申请看板。配置 Supabase 后，访问同一网址的多人会读取和修改同一份云端数据，修改会自动保存并实时同步。

## 1. 创建云数据库

1. 登录 [Supabase](https://supabase.com/) 并创建一个免费项目。
2. 打开 **SQL Editor**，复制并运行 [`supabase.sql`](./supabase.sql) 的全部内容。
3. 打开 **Project Settings → API**，复制 `Project URL` 和 `anon public key`。
4. 编辑 [`config.js`](./config.js)：

```js
window.APP_CONFIG = {
  supabaseUrl: '你的 Project URL',
  supabaseAnonKey: '你的 anon public key'
};
```

`anon public key` 本来就是给网页使用的公开密钥。切勿填写 `service_role` key。

## 2. 上传并发布到 GitHub

在 GitHub 新建一个仓库，然后在本目录运行：

```bash
git add .
git commit -m "Deploy collaborative application tracker"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

随后进入仓库的 **Settings → Pages**，在 **Build and deployment → Source** 中选择 **GitHub Actions**。等待 Actions 完成后，Pages 页面会显示公开网址。

## 数据与权限说明

- 未配置 Supabase 时，页面仍可使用，但数据只保存在当前浏览器。
- 当前数据库策略适合“拿到网址即可共同编辑”的需求；任何访问者都能新增、修改和删除内容。
- 页面中的申请资料会公开给拿到网址的人。不要填写密码、身份证号、银行卡号等敏感信息。
- 若只希望受邀成员编辑，应在下一步加入 Supabase 登录和成员权限控制。
- “导出数据”可定期下载 JSON 备份，误删后可用“导入数据”恢复。
