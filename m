<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>آلة حاسبة المطاعم مع تطبيقات التوصيل</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
            direction: rtl;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        button:hover {
            background-color: #218838;
        }
        .result {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>آلة حاسبة المطاعم مع تطبيقات التوصيل</h1>
    <div class="container">
        <label>قيمة الطلب الواحد (ريال):</label>
        <input type="number" id="orderValue" placeholder="أدخل قيمة الطلب الواحد" />

        <label>عدد الطلبات اليومية:</label>
        <input type="number" id="dailyOrders" placeholder="أدخل عدد الطلبات اليومية" />

        <label>نسبة عمولة التطبيق (%):</label>
        <input type="number" id="appCommission" placeholder="أدخل نسبة العمولة" />

        <label>تكلفة إنتاج الوجبة (ريال):</label>
        <input type="number" id="mealCost" placeholder="أدخل تكلفة إنتاج الوجبة" />

        <label>تكلفة التعبئة للطلب (ريال):</label>
        <input type="number" id="packagingCost" placeholder="أدخل تكلفة التعبئة" />

        <label>رسوم الاشتراك الشهري للتطبيق (ريال):</label>
        <input type="number" id="monthlySubscription" placeholder="أدخل رسوم الاشتراك الشهري" />

        <label>التكاليف الشهرية الثابتة (رواتب وإيجار) (ريال):</label>
        <input type="number" id="fixedCosts" placeholder="أدخل التكاليف الثابتة" />

        <label>التسويق المدفوع داخل التطبيق (ريال):</label>
        <input type="number" id="marketingCost" placeholder="أدخل تكلفة التسويق" />

        <button onclick="calculateProfit()">احسب الأرباح</button>

        <div class="result" id="result"></div>
    </div>

    <script>
        function calculateProfit() {
            const orderValue = parseFloat(document.getElementById("orderValue").value) || 0;
            const dailyOrders = parseInt(document.getElementById("dailyOrders").value) || 0;
            const appCommission = parseFloat(document.getElementById("appCommission").value) || 0;
            const mealCost = parseFloat(document.getElementById("mealCost").value) || 0;
            const packagingCost = parseFloat(document.getElementById("packagingCost").value) || 0;
            const monthlySubscription = parseFloat(document.getElementById("monthlySubscription").value) || 0;
            const fixedCosts = parseFloat(document.getElementById("fixedCosts").value) || 0;
            const marketingCost = parseFloat(document.getElementById("marketingCost").value) || 0;

            const totalOrders = dailyOrders * 30; // عدد الطلبات الشهرية
            const revenue = totalOrders * orderValue; // إجمالي الإيرادات
            const totalCommission = revenue * (appCommission / 100); // عمولة التطبيق
            const totalMealCost = totalOrders * mealCost; // تكلفة إنتاج الوجبات
            const totalPackagingCost = totalOrders * packagingCost; // تكلفة التغليف
            const totalCosts = totalCommission + totalMealCost + totalPackagingCost + monthlySubscription + fixedCosts + marketingCost;

            const netProfit = revenue - totalCosts;

            let resultMessage = `صافي الأرباح الشهرية: ${netProfit.toFixed(2)} ريال`;
            if (netProfit < 0) {
                resultMessage += " - انت تخسر مع التطبيق الحالي.";
            } else if (netProfit > 0) {
                resultMessage += " - انت تربح مع التطبيق الحالي.";
            } else {
                resultMessage += " - انت لا تخسر ولا تكسب مع التطبيق الحالي - متعادل.";
            }

            document.getElementById("result").innerText = resultMessage;
        }
    </script>
</body>
</html>
