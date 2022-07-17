<template>
    <div class="layout">
        <!-- 左侧导航区域 -->
        <Menu class="menu"></Menu>
        <!-- 右侧内容区域 -->
        <MainContent class="content"></MainContent>
    </div>
</template>

<script>
    import Menu from "./Menu";
    import MainContent from "./MainContent";
    export default {
        name: "Index",
        components: {
            Menu, MainContent
        }
    }
</script>

<style scoped>
    .layout {
    }
    .menu {
        width: 200px;
        min-height: 500px;
        background-color: #39c5bb;
        position: fixed;
        top: 0;
        bottom: 0;
    }
    .content {
        margin-left: 200px;
    }
</style>