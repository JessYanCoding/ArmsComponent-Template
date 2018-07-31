![Logo](https://raw.githubusercontent.com/JessYanCoding/ArmsComponent/master/arts/arms_component_banner_v1.0.jpg)

**一键搭建 [ArmsComponent](https://github.com/JessYanCoding/ArmsComponent) 快速组件化方案的整体组件架构, 让新手也可以一秒开始组件化项目, 开发神器, 让您一秒起飞, 体验纯傻瓜式的组件化开发, 避免组件化从入门到放弃!**

> **Tips: 先使用 ArmsComponent-Template (Module 级一键模板) 一键搭建整体组件架构, 再使用 [MVPArmsTemplate](https://github.com/JessYanCoding/MVPArmsTemplate) (页面级一键模板) 一键生成每个业务页面所需要的 MVP 及 Dagger2 相关类, 即可让什么都不懂的新手也可以一秒开始组件化项目!**  
> **若您基于本模板修改并且开源于网络, 请注明出处, 尊重开源, 才有人愿意开源, 谢谢!**

此模板会持续保持更新新的内容并同步兼容最新的 **AndroidStudio 稳定版**, 如果最新的模板代码不能兼容您的 **AndroidStudio 旧版本**, 请自行升级  **AndroidStudio** 到最新的稳定版, 或者自行回滚模板代码到能兼容旧版本的代码 (因为模板也是和 **AndroidStudio** 的版本同步更新的, 但也可能模板第一次提交兼容的版本都高于您的 **AndroidStudio** 旧版本), 此模板由于会随时更新新的内容, 所以不可能为每个 **AndroidStudio** 版本都维护一个分支, 这将极大的增加我的工作量, 所以在受益于模板带来的便利的同时, 也请尊重我的决定, 请不要提关于 **AndroidStudio 旧版本** 不兼容的 **Issues**, 谢谢

## Overview
![gif](art/ArmsComponent-Template.gif)

## 如何安装？
请将 **NewArmsComponent** 这个文件夹复制到 **AndroidStudio Module** 模版的存放路径, 请注意是复制整个文件夹, 不是里面的内容!

**AndroidStudio Module** 模版存放路径 (**请注意 Module 级模板和页面级模板的存放路径不一样, 不要放错了!**):

* Windows : AS安装目录/plugins/android/lib/templates/gradle-projects

* Mac : /Applications/Android Studio.app/Contents/plugins/android/lib/templates/gradle-projects

**最后记得重启 AndroidStudio !**

## 如何使用?
使用时按下图步骤即可, 也可以使用快捷键, **Mac** 的快捷键是在项目名上按 **Command + n**, 选择  **Module**, **Windows** 快捷键自己百度

![step](art/step.jpeg)

## 注意事项
* 本模板是基于 [ArmsComponent](https://github.com/JessYanCoding/ArmsComponent) 开发的, 所以使用的是 **ArmsComponent** 的整体架构, 模板依赖了 **ArmsComponent** 官方工程中的一些文件如 [isBuildModule](https://github.com/JessYanCoding/ArmsComponent/blob/master/gradle.properties#L19), 最优的方式是直接 **clone** 或下载 **ArmsComponent** 的官方工程后, 在工程上面直接使用本模板, 开始业务的开发, 让您体验纯傻瓜式的组件化开发

* 使用本模板生成的组件马上就可以独立运行, 但是如果您想要集成调试, 还需要在宿主 **App** 中 [依赖此组件](https://github.com/JessYanCoding/ArmsComponent/blob/master/app/build.gradle#L55)
```gradle
  dependencies {
    if (!isBuildModule.toBoolean()) {
        //在宿主 App 中使用 implementation 依赖业务组件, 业务组件的代码就会完全暴露给宿主 App, 不利于代码的隔离
        //使用 runtimeOnly 依赖业务组件, 可实现业务组件的代码在编译时对宿主 App 不可见, 仅在运行时对宿主 App 可见
        runtimeOnly project(":ModuleZhihu")
        runtimeOnly project(":ModuleGank")
        runtimeOnly project(":ModuleGold")
        runtimeOnly project(":组件名(Module name)")
    }
  }
```

![attention-1](art/attention-1.jpeg)

![attention-2](art/attention-2.jpeg)
