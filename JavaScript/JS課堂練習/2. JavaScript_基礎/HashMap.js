var HashMap = function () {
    let map = {};
    return {
        // 向HashMap中添加一個key:value
        put: function (key, value) {
            map[key] = value;
        },

        // 獲取HashMap中所有的key
        keys: function () {
            return Object.keys(map);
        },

        // 檢查HashMap中是否包含某個key
        contains: function (key) {
            return map.hasOwnProperty(key);
        },

        // 根據key獲取對應的value
        get: function (key) {
            return map[key];
        },

        // 清空HashMap
        clear: function (key) {
            map = {};
        }
    };
};