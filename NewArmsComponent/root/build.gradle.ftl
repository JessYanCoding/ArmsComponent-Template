<#import "root://activities/common/kotlin_macros.ftl" as kt>
if (isBuildModule.toBoolean()) {
    apply plugin: 'com.android.application'
} else {
    apply plugin: 'com.android.library'
}
apply plugin: 'com.jakewharton.butterknife'
<@kt.addKotlinPlugins />

android {
    compileSdkVersion rootProject.ext.android["compileSdkVersion"]
    <#if compareVersionsIgnoringQualifiers(gradlePluginVersion, '3.0.0') lt 0>buildToolsVersion rootProject.ext.android["buildToolsVersion"]</#if>
    useLibrary 'org.apache.http.legacy'

    compileOptions {
        targetCompatibility JavaVersion.VERSION_1_8
        sourceCompatibility JavaVersion.VERSION_1_8
    }

    defaultConfig {
        minSdkVersion rootProject.ext.android["minSdkVersion"]
        targetSdkVersion rootProject.ext.android["targetSdkVersion"]
        versionCode rootProject.ext.android["versionCode"]
        versionName rootProject.ext.android["versionName"]
        testInstrumentationRunner rootProject.ext.dependencies["androidJUnitRunner"]
        javaCompileOptions {
            annotationProcessorOptions {
                arguments = [moduleName: project.getName()]
                includeCompileClasspath true
            }
        }
    }

    buildTypes {
        debug {
            buildConfigField "boolean", "LOG_DEBUG", "true"
            buildConfigField "boolean", "USE_CANARY", "true"
            buildConfigField "boolean", "IS_BUILD_MODULE", "${r"${isBuildModule}"}"
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }

        release {
            buildConfigField "boolean", "LOG_DEBUG", "false"
            buildConfigField "boolean", "USE_CANARY", "false"
            buildConfigField "boolean", "IS_BUILD_MODULE", "${r"${isBuildModule}"}"
            minifyEnabled false
            shrinkResources false
            zipAlignEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }

//    resourcePrefix "ModuleName_" //给 Module 内的资源名增加前缀, 避免资源名冲突, 建议使用 Module 名作为前缀

    lintOptions {
        disable 'InvalidPackage'
        disable "ResourceType"
        abortOnError false
    }

    sourceSets {
        main {
            jniLibs.srcDirs = ['libs']
            if (isBuildModule.toBoolean()) {
                manifest.srcFile 'src/main/debug/AndroidManifest.xml'
            } else {
                manifest.srcFile 'src/main/release/AndroidManifest.xml'
            }
        }
    }
}

dependencies {
    ${getConfigurationName("compile")} fileTree(dir: 'libs', include: ['*.jar'])
    //因为 CommonRes 依赖了 CommonSDK, 所以如果业务模块需要公共 UI 组件就依赖 CommonRes, 如果不需要就只依赖 CommonSDK
    api project(":CommonRes")
    api project(":CommonService")
    if (isBuildModule.toBoolean()) {
        //view
        annotationProcessor(rootProject.ext.dependencies["butterknife-compiler"]) {
            exclude module: 'support-annotations'
        }
        //tools
        annotationProcessor rootProject.ext.dependencies["dagger2-compiler"]
        annotationProcessor rootProject.ext.dependencies["arouter-compiler"]
        //test
        debugImplementation rootProject.ext.dependencies["canary-debug"]
        releaseImplementation rootProject.ext.dependencies["canary-release"]
        testImplementation rootProject.ext.dependencies["canary-release"]
        testImplementation rootProject.ext.dependencies["junit"]
    } else {
        ${getConfigurationName("provided")} rootProject.ext.dependencies["butterknife-compiler"]
        ${getConfigurationName("provided")} rootProject.ext.dependencies["dagger2-compiler"]
        ${getConfigurationName("provided")} rootProject.ext.dependencies["arouter-compiler"]
        ${getConfigurationName("provided")} rootProject.ext.dependencies["canary-debug"]
        ${getConfigurationName("provided")} rootProject.ext.dependencies["canary-release"]
        ${getConfigurationName("provided")} rootProject.ext.dependencies["junit"]
    }
    <@kt.addKotlinDependencies />
}
