<#import "root://activities/common/kotlin_macros.ftl" as kt>
<@kt.addKotlinPlugins />
apply from:"../common_component_build.gradle"

android {
//    resourcePrefix "ModuleName_" //给 Module 内的资源名增加前缀, 避免资源名冲突, 建议使用 Module 名作为前缀
}

dependencies {
    ${getConfigurationName("compile")} fileTree(dir: 'libs', include: ['*.jar'])
    //因为 CommonRes 依赖了 CommonSDK, 所以如果业务模块需要公共 UI 组件就依赖 CommonRes, 如果不需要就只依赖 CommonSDK
    api project(":CommonRes")
    api project(":CommonService")
    <@kt.addKotlinDependencies />
}
