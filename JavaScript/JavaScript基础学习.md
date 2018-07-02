# JavaScript基础学习

# 1. JavaScript简介
## 1.2. JavaScript特点

1. 安全性（不允许直接访问本地硬盘），它可以做的就是信息的动态交互。
2. 跨平台性。（只要是可以解释Js的浏览器都可以执行，和平台无关。）
3. 交互性：校验用户在表单中的输入数据

## 1.2. JavaScript与Java不同

1. JS是Netscape公司的产品，Java是Sun公司的产品
2. JS是基于对象，Java是面向对象。
3. JS只需解释就可以执行，Java需要先编译成字节码文件，再执行。
4. JS是弱类型，Java是强类型。

## 1.3. JavaScript内容
ECMAScript 是一个重要的标准，但它并不是 JavaScript 唯一的部分，一个完整的 JavaScript 实现是由以下 3 个不同部分组成的：

![1](http://oojl6chve.bkt.clouddn.com//18-6-8/68064512.jpg)

目前我们学习JavaScript也就是需要学习：

 JavaScript语法基础

 使用JS操作网页（DOM）：**DOM**是**Document Object Model**的缩写，即文档对象模型，主要用来获取文档中标签的属性，例如获取html中某个input的value的值。

 使用JS操作浏览器（BOM）：**BOM**是**Browser Object Model**的缩写，即浏览器对象模型，主要用来获取浏览器的属性和行为，比如获取浏览器的版本，获取浏览器中的历史记录等等。


# 2. JavaScript基础

## 2.1. 语法

### 2.1.1. 引入方式和引入位置

1. html内部

```javascript
    <script type = "text/javascript">
        window.document.write("内部嵌入的js");
    </script>
```

2. html外部

```javascript
   <script type="text/javascript" src = "../js/my.js"></script>
```

**位置**：引入js的代码可以放到html中的任意地方，在不影响html功能的前提下，建议放在html中的最下面的body和html标签之间，这样浏览器会在最后加载js，可以提升一些性能

### 2.2.2