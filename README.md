# ArmsComponent-Template
**一键搭建 [ArmsComponent](https://github.com/JessYanCoding/ArmsComponent) 快速组件化方案的整体组件架构, 让新手也可以一秒开始组件化项目, 开发神器, 让您一秒起飞, 体验纯傻瓜式的组件化开发, 避免组件化从入门到放弃!**

> **Tips: 先使用 ArmsComponent-Template (Module 级一键模板) 一键搭建整体组件架构, 再使用 [MVPArmsTemplate](https://github.com/JessYanCoding/MVPArmsTemplate) (页面级一键模板) 一键生成每个业务页面所需要的 MVP 及 Dagger2 相关类, 即可让什么都不懂的新手也可以一秒开始组件化项目!**

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
* 本模板是基于 [ArmsComponent](https://github.com/JessYanCoding/ArmsComponent) 开发的, 所以使用的是 **ArmsComponent** 的整体架构, 最优的方式是直接 **clone** 或下载 **ArmsComponent** 工程后, 在工程上面直接使用本模板, 开始业务的开发, 让您体验纯傻瓜式的组件化开发

* 使用本模板生成的组件马上就可以独立运行, 但是如果您想要集成调试, 还需要在宿主 **App** 中依赖此组件
```gradle
  dependencies {
    if (!isBuildModule.toBoolean()) {
        implementation project(":ModuleZhihu")
        implementation project(":ModuleGank")
        implementation project(":ModuleGold")
        implementation project(":组件名(Module name)")
    }
  }
```


* 此模板会持续保持更新, 但只保证能够兼容最新的 **AndroidStudio 稳定版**, 暂不提供其他版本

  ![attention-1](art/attention-1.jpeg)

  ![attention-2](art/attention-2.jpeg)
