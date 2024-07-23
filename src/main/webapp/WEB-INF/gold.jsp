<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <link rel="stylesheet" href="/css/styles.css">
            <title>Gold</title>
        </head>
        <body>
            <div class="container mt-4">
                <div class="d-flex text-center gap-1 mb-4">
                    <h1 class="">Your Gold: </h1>
                    <div class="w-25 border align-self-center">
                        <h2>
                            <c:out value="${gold}" />
                        </h2>
                    </div>
                </div>

                <div class="row row-cols-1 row-cols-md-4 g-2">
                    <div class="col">
                        <div class="card text-center">
                            <h5 class="card-header">Farm</h5>
                            <div class="card-body p-5">
                                <p class="card-text">(earns 10-20 gold)
                                </p>
                                <form action="/gold/farm" method="post">
                                    <button type="submit" class="btn btn-primary">Find Gold!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-center">
                            <h5 class="card-header">Cave</h5>
                            <div class="card-body p-5">
                                <p class="card-text">(earns 5-10 gold)
                                </p>
                                <form action="/gold/cave" method="post">
                                    <button type="submit" class="btn btn-primary">Find Gold!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-center">
                            <h5 class="card-header">House</h5>
                            <div class="card-body p-5">
                                <p class="card-text">(earns 2-5 gold)
                                </p>
                                <form action="/gold/house" method="post">
                                    <button type="submit" class="btn btn-primary">Find Gold!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-center">
                            <h5 class="card-header">Casino!</h5>
                            <div class="card-body p-5">
                                <p class="card-text">(earns/takes 0-50 gold)
                                </p>
                                <form action="/gold/casino" method="post">
                                    <button type="submit" class="btn btn-primary">Find Gold!</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-4">
                    <h3>Activities: </h3>

                    <div class=" bg-body-tertiary p-2 rounded-2 activities card" tabindex="0">
                        <c:forEach items="${activities.reversed()}" var="activity">
                            <c:if test="${activity.contains('lost')}">
                                <p class="text-danger">
                                    <c:out value="${activity}" />
                                </p>
                            </c:if>
                            <c:if test="${!activity.contains('lost')}">
                                <p class="text-success">
                                    <c:out value="${activity}" />
                                </p>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </body>
    </html>