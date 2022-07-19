<template>
    <div class="layout">
        <Layout>
            <MainHeader style="height: 60px"></MainHeader>
            <MainContent class="layout-content"></MainContent>
            <MainFooter class="layout-footer"></MainFooter>
        </Layout>
    </div>
</template>

<script>
    import MainContent from "./MainContent";
    import MainHeader from "./MainHeader";
    import MainFooter from "./MainFooter";
    export default {
        name: "Index",
        components: {
            MainHeader,
            MainContent,
            MainFooter
        }
    }
</script>

<style scoped>
    .layout{
        border: 1px solid #d7dde4;
        background: #f5f7f9;
        position: relative;
        border-radius: 4px;
        overflow: hidden;
    }
    .layout-content {
        position: fixed;
        top: 60px;
        bottom: 30px;
        left: 0;
        right: 0;
    }
    .layout-footer {
        height: 30px;
        vertical-align: center;
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
    }
</style>