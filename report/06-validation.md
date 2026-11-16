# Capítulo VI: Product Validation

En este capítulo se explica cómo se comprobó que la propuesta de SangreLima cumple con lo planteado en las User Stories y si realmente es fácil de utilizar para los tres segmentos de usuarios identificados. Para ello, primero se elaboraron los Acceptance Tests utilizando Gherkin. Después, se realizaron entrevistas con usuarios reales, quienes probaron el Landing Page y los prototipos de la aplicación móvil. Finalmente, se revisó el diseño teniendo en cuenta aspectos como la facilidad de uso, la organización de la información y la inclusión, con el fin de identificar qué funciona bien y qué aspectos todavía se pueden mejorar.

## 6.1. Acceptance Tests

Los Acceptance Tests permiten comprobar si las 50 User Stories (sección 3.2) cumplen con lo que se había establecido desde el inicio. Para ello, sus criterios de aceptación se transformaron en escenarios utilizando el lenguaje Gherkin, que sigue la estructura Given / When / Then. Además, se creó un archivo .feature para cada épica, de manera que las historias de usuario relacionadas con una misma funcionalidad quedaran agrupadas y fueran más fáciles de organizar y revisar.

Convenciones aplicadas:

Para mantener las pruebas ordenadas y facilitar su revisión, se siguieron algunas convenciones al momento de crear los archivos:

- Los archivos .feature se redactaron en inglés y siguiendo la estructura estándar de Gherkin, tal como lo solicita el curso.

- Cada escenario incluye el ID de su User Story (por ejemplo, @US01). Esto permite identificar fácilmente a qué historia de usuario corresponde cada prueba.

- De los 50 User Stories, se seleccionaron 12 para la comparación en Android. Estas se identifican con la etiqueta adicional @android-comparative: US01, US04, US12, US14, US17, US18, US22, US24, US30, US32, US35 y US45.

- También se consideraron situaciones en las que algo podría salir mal, además de los escenarios donde todo funciona correctamente. Por ejemplo, solicitudes con campos vacíos (US01), unidades no válidas (US03), rechazos o correcciones sin justificación (US11, US13), alertas para solicitudes que no son compatibles (US24), donaciones sin registro de llegada (US45) y reportes sin indicar un motivo (US49).

- Finalmente, todos los archivos siguen el mismo formato de nombre: epNN-nombre-en-ingles.feature, lo que ayuda a mantenerlos organizados según cada épica.

Relación de tests diseñados:

| **Archivo .feature** | **Épica** | **User Stories** | **Escenarios** |
|----|----|----|----|
| ep01-blood-requests.feature | EP01 Gestión de solicitudes de sangre | US01 a US08 | 10 |
| ep02-institutional-validation.feature | EP02 Validación institucional de solicitudes | US09 a US15 | 9 |
| ep03-donor-matching.feature | EP03 Matching y elegibilidad de donantes | US16 a US23 | 8 |
| ep04-segmented-alerts.feature | EP04 Alertas y notificaciones segmentadas | US24 a US29 | 7 |
| ep05-donation-coordination.feature | EP05 Respuesta y coordinación de la donación | US30 a US36 | 7 |
| ep06-donor-history.feature | EP06 Historial y recurrencia del donante | US37 a US41 | 5 |
| ep07-health-center-management.feature | EP07 Gestión institucional del centro de salud | US42 a US46 | 6 |
| ep08-trust-and-information.feature | EP08 Confianza e información verificada | US47 a US50 | 5 |
| **Total** | 8 épicas | 50 User Stories | **57** |

Código de los archivos.feature:

- ep01-blood-requests.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Gestión de solicitudes de sangre</p>
<p>Como familiar de un paciente</p>
<p>Quiero registrar y hacer seguimiento a una solicitud de sangre</p>
<p>Para encontrar donantes compatibles sin depender de cadenas de mensajes</p>
<p>@US01 @android-comparative</p>
<p>Scenario: Registrar una solicitud urgente de sangre</p>
<p>Given que necesito sangre para un paciente</p>
<p>When completo los campos obligatorios y envío la solicitud</p>
<p>Then la solicitud se guarda con el estado "Pendiente de validación"</p>
<p>@US01</p>
<p>Scenario: Enviar una solicitud con campos obligatorios vacíos</p>
<p>Given que estoy creando una solicitud</p>
<p>When dejo un campo obligatorio vacío y envío la solicitud</p>
<p>Then la solicitud no se guarda</p>
<p>And veo un mensaje de error junto al campo vacío</p>
<p>@US02</p>
<p>Scenario: Seleccionar el tipo de sangre requerido</p>
<p>Given que estoy creando una solicitud</p>
<p>When selecciono el grupo sanguíneo "O" y el factor Rh "positivo"</p>
<p>Then el sistema guarda "O+" como criterio de compatibilidad</p>
<p>@US03</p>
<p>Scenario: Ingresar la cantidad de unidades de sangre</p>
<p>Given que estoy completando una solicitud</p>
<p>When ingreso 2 unidades</p>
<p>Then el sistema muestra y conserva "2 unidades" para el caso</p>
<p>@US03</p>
<p>Scenario: Rechazar una cantidad de unidades no válida</p>
<p>Given que estoy completando una solicitud</p>
<p>When ingreso 0 unidades</p>
<p>Then el sistema me solicita ingresar al menos 1 unidad</p>
<p>@US04 @android-comparative</p>
<p>Scenario: Vincular la solicitud con un centro de salud</p>
<p>Given que estoy registrando una solicitud</p>
<p>When selecciono un centro de salud disponible</p>
<p>Then la solicitud queda vinculada a ese centro de salud</p>
<p>@US05</p>
<p>Scenario: Mostrar la ubicación del punto de donación</p>
<p>Given que la solicitud está vinculada a un centro de salud</p>
<p>When abro la ubicación registrada</p>
<p>Then veo el punto de donación en un mapa junto con su dirección</p>
<p>@US06</p>
<p>Scenario: Establecer el nivel de urgencia</p>
<p>Given que estoy completando una solicitud</p>
<p>When selecciono el nivel de urgencia "Urgente"</p>
<p>Then la solicitud aparece identificada visualmente como urgente</p>
<p>@US07</p>
<p>Scenario: Revisar la solicitud antes de enviarla</p>
<p>Given que he completado los datos de la solicitud</p>
<p>When selecciono la opción "Revisar"</p>
<p>Then veo un resumen de la solicitud</p>
<p>And puedo regresar para editar cualquier campo antes de enviarla</p>
<p>@US08</p>
<p>Scenario: Consultar el avance de una solicitud activa</p>
<p>Given que tengo una solicitud activa</p>
<p>When abro el detalle de la solicitud</p>
<p>Then veo su estado y la cantidad de confirmaciones recibidas</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep02-institutional-validation.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Validación institucional de solicitudes</p>
<p>Como personal autorizado de un centro de salud</p>
<p>Quiero revisar y validar las solicitudes</p>
<p>Para asegurar que solo los casos legítimos lleguen a los donantes</p>
<p>@US09</p>
<p>Scenario: Ver las solicitudes pendientes de mi centro de salud</p>
<p>Given que una solicitud está vinculada a mi centro de salud</p>
<p>When ingreso a la bandeja de solicitudes pendientes</p>
<p>Then veo la solicitud lista para ser revisada</p>
<p>@US10</p>
<p>Scenario: Verificar los datos de una solicitud</p>
<p>Given que una solicitud está pendiente de validación</p>
<p>When abro su información</p>
<p>Then puedo revisar los datos clínicos y administrativos antes de aprobarla o rechazarla</p>
<p>@US11</p>
<p>Scenario: Solicitar al usuario que corrija los datos</p>
<p>Given que detecto información incompleta o incorrecta</p>
<p>When marco la solicitud para su corrección e ingreso el motivo</p>
<p>Then el solicitante recibe la observación</p>
<p>And puede actualizar los datos</p>
<p>@US11</p>
<p>Scenario: Solicitar una corrección sin indicar el motivo</p>
<p>Given que detecto información incompleta</p>
<p>When marco la solicitud para su corrección sin indicar un motivo</p>
<p>Then el sistema me solicita escribir el motivo</p>
<p>@US12 @android-comparative</p>
<p>Scenario: Aprobar una solicitud de sangre</p>
<p>Given que la información de una solicitud es válida</p>
<p>When confirmo la aprobación con la opción "Aprobar y enviar alerta"</p>
<p>Then el estado de la solicitud cambia a "Validada"</p>
<p>And la solicitud queda habilitada para buscar donantes compatibles</p>
<p>@US13</p>
<p>Scenario: Rechazar una solicitud no válida</p>
<p>Given que una solicitud no cumple con las condiciones de validación</p>
<p>When selecciono "Rechazar" e ingreso un motivo</p>
<p>Then la solicitud queda marcada como rechazada</p>
<p>And no se envían alertas a los donantes</p>
<p>@US13</p>
<p>Scenario: Rechazar una solicitud sin indicar el motivo</p>
<p>Given que una solicitud no cumple con las condiciones de validación</p>
<p>When selecciono "Rechazar" sin indicar un motivo</p>
<p>Then la solicitud permanece pendiente</p>
<p>And el sistema me solicita escribir el motivo</p>
<p>@US14 @android-comparative</p>
<p>Scenario: Mostrar la validación institucional al donante</p>
<p>Given que una solicitud fue aprobada por un centro de salud</p>
<p>When un donante consulta el detalle de la solicitud</p>
<p>Then ve el estado "Validada" y el centro de salud responsable</p>
<p>@US15</p>
<p>Scenario: Advertir sobre una posible solicitud duplicada</p>
<p>Given que existe una solicitud activa para el mismo paciente y centro de salud</p>
<p>When se registra una nueva solicitud con datos similares</p>
<p>Then el sistema muestra una advertencia de posible duplicado al personal antes de aprobarla</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep03-donor-matching.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Búsqueda de donantes y evaluación de compatibilidad</p>
<p>Como plataforma</p>
<p>Quiero relacionar las solicitudes validadas con donantes aptos</p>
<p>Para contactar únicamente a personas compatibles, cercanas y disponibles</p>
<p>@US16</p>
<p>Scenario: Registrar el tipo de sangre del donante</p>
<p>Given que soy un donante y estoy configurando mi perfil</p>
<p>When registro mi grupo sanguíneo y factor Rh</p>
<p>Then el sistema utiliza esos datos para buscar solicitudes compatibles</p>
<p>@US17 @android-comparative</p>
<p>Scenario: Seleccionar únicamente donantes compatibles</p>
<p>Given que la solicitud requiere el tipo de sangre "O-"</p>
<p>When se inicia la búsqueda de donantes</p>
<p>Then solo se consideran donantes con un tipo de sangre compatible</p>
<p>@US18 @android-comparative</p>
<p>Scenario: Dar prioridad a los donantes cercanos</p>
<p>Given que la solicitud tiene registrada la ubicación de un centro de salud</p>
<p>When se buscan posibles donantes</p>
<p>Then se da prioridad a los donantes que se encuentran cerca del centro de salud</p>
<p>@US19</p>
<p>Scenario: Excluir a los donantes que realizaron una donación recientemente</p>
<p>Given que un donante tiene registrada una donación anterior</p>
<p>When se evalúa su disponibilidad para una nueva solicitud</p>
<p>Then se verifica el tiempo transcurrido desde su última donación antes de incluirlo</p>
<p>@US20</p>
<p>Scenario: Tener en cuenta la disponibilidad del donante</p>
<p>Given que soy un donante activo</p>
<p>When marco mi estado como no disponible</p>
<p>Then no soy seleccionado como posible donante</p>
<p>@US21</p>
<p>Scenario: Excluir temporalmente a los donantes que no son aptos</p>
<p>Given que el sistema detecta que temporalmente no cumplo con los requisitos para donar</p>
<p>When se genera una lista de posibles donantes</p>
<p>Then mi perfil no se incluye hasta que la condición deje de aplicarse</p>
<p>@US22 @android-comparative</p>
<p>Scenario: Ordenar los donantes según su nivel de compatibilidad</p>
<p>Given que existen varios posibles donantes</p>
<p>When se realiza la búsqueda de coincidencias</p>
<p>Then los resultados se ordenan según la compatibilidad, cercanía y disponibilidad</p>
<p>@US23</p>
<p>Scenario: Actualizar la búsqueda cuando cambia una solicitud</p>
<p>Given que una solicitud validada cambia su tipo de sangre, ubicación o estado</p>
<p>When se confirma la actualización</p>
<p>Then el sistema vuelve a buscar posibles donantes utilizando los nuevos datos</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep04-segmented-alerts.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Alertas y notificaciones segmentadas</p>
<p>Como donante</p>
<p>Quiero recibir únicamente alertas relevantes</p>
<p>Para poder responder rápidamente sin recibir demasiadas notificaciones innecesarias</p>
<p>@US24 @android-comparative</p>
<p>Scenario: Recibir una alerta de una solicitud compatible</p>
<p>Given que existe una solicitud validada compatible con mi perfil</p>
<p>When se generan las alertas segmentadas</p>
<p>Then recibo una notificación sobre ese caso</p>
<p>@US24</p>
<p>Scenario: No recibir alertas de solicitudes incompatibles</p>
<p>Given que existe una solicitud validada que requiere un tipo de sangre que no puedo donar</p>
<p>When se generan las alertas segmentadas</p>
<p>Then no recibo ninguna notificación</p>
<p>@US25</p>
<p>Scenario: Visualizar los datos principales en la alerta</p>
<p>Given que recibo una alerta de donación</p>
<p>When reviso la notificación</p>
<p>Then puedo ver el tipo de sangre, el centro de salud y el nivel de urgencia sin tener que buscar más información</p>
<p>@US26</p>
<p>Scenario: Conocer la distancia hasta el centro de salud</p>
<p>Given que una solicitud tiene una ubicación válida</p>
<p>When abro su información</p>
<p>Then veo la distancia aproximada desde mi ubicación autorizada</p>
<p>@US27</p>
<p>Scenario: Abrir el detalle de una solicitud desde una notificación</p>
<p>Given que recibí una notificación sobre una solicitud compatible</p>
<p>When presiono la notificación</p>
<p>Then la aplicación abre el detalle de esa solicitud</p>
<p>@US28</p>
<p>Scenario: Recibir notificaciones sobre cambios importantes en una solicitud</p>
<p>Given que confirmé mi disponibilidad para una solicitud</p>
<p>When el centro de salud actualiza información importante</p>
<p>Then recibo una notificación con los cambios realizados</p>
<p>@US29</p>
<p>Scenario: Dejar de recibir alertas de una solicitud que ya fue atendida</p>
<p>Given que una solicitud cambia al estado "Cubierta" o "Cancelada"</p>
<p>When el sistema actualiza su estado</p>
<p>Then no se generan nuevas alertas para ese caso</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep05-donation-coordination.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Coordinación de respuestas y donaciones</p>
<p>Como donante, solicitante o personal de un centro de salud</p>
<p>Quiero coordinar cada etapa de la donación</p>
<p>Para que el avance real de una solicitud esté siempre claro</p>
<p>@US30 @android-comparative</p>
<p>Scenario: Confirmar disponibilidad con un solo toque</p>
<p>Given que soy un donante y estoy viendo una solicitud validada y compatible</p>
<p>When presiono la opción "Puedo donar"</p>
<p>Then el sistema registra mi respuesta</p>
<p>And mi confirmación se agrega al seguimiento de la solicitud</p>
<p>@US31</p>
<p>Scenario: Rechazar una solicitud</p>
<p>Given que soy un donante que recibió una solicitud compatible</p>
<p>When selecciono que no puedo participar</p>
<p>Then mi respuesta queda registrada como "No disponible" para ese caso</p>
<p>@US32 @android-comparative</p>
<p>Scenario: Ver los donantes que confirmaron su disponibilidad</p>
<p>Given que soy un solicitante y tengo una solicitud activa</p>
<p>When uno o más donantes confirman su disponibilidad</p>
<p>Then el contador de confirmaciones se actualiza en el detalle de la solicitud</p>
<p>@US33</p>
<p>Scenario: Consultar las indicaciones antes de acudir a donar</p>
<p>Given que soy un donante que confirmó su disponibilidad</p>
<p>When abro las indicaciones de la solicitud</p>
<p>Then veo el centro de salud, su ubicación y las recomendaciones registradas</p>
<p>@US34</p>
<p>Scenario: Indicar que estoy en camino</p>
<p>Given que soy un donante que confirmó su disponibilidad</p>
<p>When presiono la opción "Estoy en camino"</p>
<p>Then mi estado de asistencia se actualiza para ese caso</p>
<p>@US35 @android-comparative</p>
<p>Scenario: Confirmar la llegada de un donante</p>
<p>Given que un donante se presenta para atender una solicitud</p>
<p>When el personal del centro de salud confirma su llegada</p>
<p>Then el sistema registra su asistencia vinculada al caso</p>
<p>@US36</p>
<p>Scenario: Notificar que la necesidad de sangre ya fue cubierta</p>
<p>Given que la solicitud alcanza la cantidad de donantes definida por el centro de salud</p>
<p>When el personal marca el caso como cubierto</p>
<p>Then el solicitante recibe una notificación</p>
<p>And la solicitud deja de buscar nuevos donantes</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep06-donor-history.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Historial y continuidad de donaciones</p>
<p>Como donante</p>
<p>Quiero consultar mi historial y saber cuándo puedo volver a donar</p>
<p>Para mantenerme motivado y estar disponible para futuras donaciones</p>
<p>@US37</p>
<p>Scenario: Consultar mi historial de donaciones</p>
<p>Given que tengo donaciones registradas</p>
<p>When ingreso a mi historial</p>
<p>Then veo cada donación con su fecha y estado</p>
<p>@US38</p>
<p>Scenario: Conocer la próxima fecha estimada para donar</p>
<p>Given que tengo registrada mi última donación</p>
<p>When consulto mi estado de elegibilidad</p>
<p>Then veo la próxima fecha estimada en la que podré volver a donar</p>
<p>@US39</p>
<p>Scenario: Recibir un recordatorio cuando vuelva a ser apto para donar</p>
<p>Given que todavía no puedo donar porque no ha transcurrido el tiempo necesario</p>
<p>When llega mi fecha estimada para volver a donar</p>
<p>Then recibo una notificación indicando que ya estoy disponible para donar nuevamente</p>
<p>@US40</p>
<p>Scenario: Obtener una insignia de reconocimiento</p>
<p>Given que completé una participación reconocida por la plataforma</p>
<p>When se actualiza mi historial</p>
<p>Then se asigna la insignia correspondiente a mi perfil</p>
<p>@US41</p>
<p>Scenario: Consultar el resumen de mis aportes</p>
<p>Given que tengo actividades registradas en la plataforma</p>
<p>When ingreso a mi resumen de participación</p>
<p>Then veo la cantidad de donaciones y acciones reconocidas que he realizado</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep07-health-center-management.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Gestión de centros de salud</p>
<p>Como personal autorizado de un centro de salud</p>
<p>Quiero gestionar las solicitudes y donaciones desde un solo lugar</p>
<p>Para conocer en todo momento el avance real de cada caso</p>
<p>@US42</p>
<p>Scenario: Ver las solicitudes activas de mi centro de salud</p>
<p>Given que existen solicitudes vinculadas a mi centro de salud</p>
<p>When ingreso al panel de solicitudes</p>
<p>Then veo los casos activos y su estado actual</p>
<p>@US43</p>
<p>Scenario: Actualizar el estado de una solicitud</p>
<p>Given que estoy a cargo de una solicitud validada</p>
<p>When selecciono un nuevo estado permitido, como "Cubierta"</p>
<p>Then el sistema actualiza el caso</p>
<p>And el cambio se refleja para los usuarios relacionados</p>
<p>@US44</p>
<p>Scenario: Registrar el resultado de la evaluación del donante</p>
<p>Given que un donante se encuentra en el centro de salud</p>
<p>When finaliza la evaluación presencial</p>
<p>Then puedo registrar si está "Apto" o "No apto"</p>
<p>And el sistema no reemplaza los criterios médicos establecidos</p>
<p>@US45 @android-comparative</p>
<p>Scenario: Registrar una donación completada</p>
<p>Given que un donante completó el proceso de donación</p>
<p>When confirmo el registro</p>
<p>Then la donación queda vinculada a la solicitud y al historial del donante</p>
<p>@US45</p>
<p>Scenario: Registrar una donación de un donante que no llegó al centro de salud</p>
<p>Given que un donante no tiene registrada su llegada para la solicitud</p>
<p>When intento registrar una donación completada</p>
<p>Then el sistema me solicita confirmar primero su llegada</p>
<p>@US46</p>
<p>Scenario: Consultar las confirmaciones, llegadas y donaciones</p>
<p>Given que una solicitud tiene actividad de donantes</p>
<p>When ingreso al detalle de la solicitud</p>
<p>Then veo por separado la cantidad de confirmaciones, llegadas y donaciones completadas</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

- ep08-trust-and-information.feature

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>Feature: Información confiable y verificada</p>
<p>Como donante o solicitante</p>
<p>Quiero acceder a información clara y verificada</p>
<p>Para confiar en cada solicitud y evitar traslados innecesarios</p>
<p>@US47</p>
<p>Scenario: Consultar los requisitos básicos antes de acudir a donar</p>
<p>Given que soy un donante y estoy evaluando una solicitud compatible</p>
<p>When abro la información sobre los requisitos</p>
<p>Then veo las condiciones básicas para poder donar</p>
<p>@US48</p>
<p>Scenario: Consultar la información del centro de salud</p>
<p>Given que una solicitud fue validada por un centro de salud</p>
<p>When abro el detalle de la solicitud</p>
<p>Then veo el nombre, la ubicación y la información disponible del centro de salud</p>
<p>@US49</p>
<p>Scenario: Reportar información sospechosa</p>
<p>Given que soy un donante y estoy viendo una solicitud activa</p>
<p>When envío un reporte indicando el motivo</p>
<p>Then el sistema registra la observación para su revisión</p>
<p>And el estado clínico del caso no cambia automáticamente</p>
<p>@US49</p>
<p>Scenario: Enviar un reporte sin indicar el motivo</p>
<p>Given que soy un donante y estoy viendo una solicitud activa</p>
<p>When envío un reporte sin indicar el motivo</p>
<p>Then el sistema me solicita seleccionar o escribir el motivo</p>
<p>@US50</p>
<p>Scenario: Compartir una solicitud verificada</p>
<p>Given que mi solicitud fue validada</p>
<p>When selecciono la opción "Compartir"</p>
<p>Then el sistema genera un contenido con la información principal y una referencia al caso verificado</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Repositorio de pruebas de aceptación:

URL del repositorio en GitHub: [<u>https://github.com/fatima-campos/sangrelima-acceptance-tests</u>](https://github.com/fatima-campos/sangrelima-acceptance-tests)

## 6.2. Entrevistas de validación.

### 6.2.1. Diseño de Entrevistas.

> La validación con usuarios busca comprobar si las personas de cada uno de los tres segmentos pueden utilizar SangreLima y realizar sus tareas principales sin necesitar ayuda. También se busca conocer si entienden los nombres de las opciones, si pueden navegar fácilmente por la plataforma y si les transmite confianza. Los resultados obtenidos permitirán identificar qué aspectos funcionan bien y cuáles necesitan mejorar. Además, servirán para comprobar si los supuestos e hipótesis planteados en el Lean UX (sección 1.2.2) realmente se cumplen.
>
> Se consideró la participación de entre 3 y 5 personas por cada segmento, lo que representa un total de 9 a 15 sesiones de validación. Los participantes se dividieron de la siguiente manera:

- **Segmento 1: Familiares y solicitantes**

> **Landing Page:** comprobar si la persona entiende qué es SangreLima y si puede encontrar fácilmente la opción para solicitar sangre.
>
> **Aplicación iOS, flujo a validar:** registrar una solicitud urgente indicando el tipo de sangre, la cantidad de unidades, el centro de salud y el nivel de urgencia. Luego, revisar la solicitud antes de enviarla y consultar su estado y la cantidad de donantes que han confirmado.
>
> **Muestra Android:** probar el registro de una solicitud urgente.
>
> **User Stories involucradas:** US01 a US08 y US32.
>
> **Tarea que se le plantea:** “Un familiar necesita sangre con urgencia. Intenta conseguir donantes utilizando esta aplicación y luego revisa cómo va tu solicitud”.

- **Segmento 2: Donantes voluntarios**

> **Landing Page:** comprobar si la persona entiende cómo funciona SangreLima y si puede encontrar fácilmente la opción para registrarse como donante.
>
> **Aplicación iOS, flujo a validar:** recibir una alerta de una solicitud compatible, abrir sus detalles, verificar que haya sido validada por el centro de salud, confirmar su disponibilidad con un solo toque y consultar las indicaciones para acudir a donar.
>
> **Muestra Android:** probar cómo se muestra una alerta y cómo se confirma la disponibilidad para donar.
>
> **User Stories involucradas:** US14, US24 a US27, US30 y US33.
>
> **Tarea que se le plantea:** “Recibes esta alerta. Decide si puedes ayudar y, si es así, confirma que estás dispuesto a donar”.

- **Segmento 3: Centros de salud y bancos de sangre**

> **Landing Page:** comprobar si el personal entiende cuál es el beneficio de SangreLima para los centros de salud y cómo puede ayudarles a gestionar las solicitudes y donaciones.
>
> **Aplicación iOS, flujo a validar:** revisar una solicitud pendiente, aprobarla o rechazarla indicando el motivo, confirmar la llegada de un donante y registrar la donación una vez completada.
>
> **Muestra Android:** probar el proceso de aprobación de una solicitud y el registro de una donación.
>
> **User Stories involucradas:** US09 a US13, US35 y US45.
>
> **Tarea que se le plantea:** “Tienes una nueva solicitud de sangre. Revisa la información y decide si corresponde aprobarla para difundirla. Luego, cuando un donante llegue al centro de salud, registra su donación”.
>
> User Flows a validar:
>
> Flujo 1. Solicitar sangre de forma urgente

- Segmento: Familiares

- Plataforma: iOS (principal) y Android (muestra)

- Pasos: abrir la app, tocar “Solicitar sangre”, elegir tipo de sangre y unidades, elegir centro de salud y urgencia, revisar el resumen, enviar y ver la solicitud en estado “Pendiente de validación”.

- User Stories: US01 a US07

- Camino alterno a probar: dejar un campo obligatorio vacío y ver cómo reacciona la app.

> Flujo 2. Seguir el avance de la solicitud

- Segmento: Familiares

- Plataforma: iOS

- Pasos: abrir la solicitud activa, ver su estado, ver cuántos donantes confirmaron.

- User Stories: US08 y US32

> Flujo 3. Responder a una alerta de donación

- Segmento: Donantes

- Plataforma: iOS (principal) y Android (muestra)

- Pasos: recibir la alerta, abrir el detalle, ver la validación del centro de salud y la distancia, confirmar disponibilidad con un toque.

- User Stories: US14, US24 a US27 y US30

- Camino alterno: declinar la solicitud (US31).

> Flujo 4. Prepararse para donar

- Segmento: Donantes

- Plataforma: iOS

- Pasos: abrir las instrucciones del centro de salud, revisar los requisitos y marcar “Voy en camino”.

- User Stories: US33, US34 y US47

> Flujo 5. Validar una solicitud

- Segmento: Centros de salud

- Plataforma: iOS (principal) y Android (muestra)

- Pasos: abrir la bandeja de pendientes, revisar los datos, aprobar la solicitud.

- User Stories: US09, US10 y US12

- Camino alterno: rechazar con motivo (US13) o pedir correcciones (US11).

> Flujo 6. Registrar la llegada y la donación

- Segmento: Centros de salud

- Plataforma: iOS (principal) y Android (muestra)

- Pasos: confirmar la llegada del donante, registrar la evaluación y registrar la donación completada.

- User Stories: US35, US44 y US45

### 6.2.2. Registro de Entrevistas.

#### Segmento 1: Familiares y solicitantes

**Entrevista 1**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Leonardo Dextre |
| Edad | 23 años |
| Distrito | Ate |
| Duración de la entrevista | 18 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Leonardo Dextre participó en la sesión de validación probando el Landing Page y el flujo de registro de solicitud urgente en la aplicación iOS. Al ingresar al Landing Page reconoció de inmediato el propósito de SangreLima: indicó que el encabezado y los botones "Necesito sangre" y "Quiero donar" le resultaron directos y sin ambigüedad. Señaló que el diseño le transmitió confianza porque mostraba solicitudes con el sello "Validada", lo cual asoció con respaldo institucional. Durante el flujo de solicitud en iOS completó los campos de tipo de sangre, unidades y centro de salud sin ayuda, aunque se detuvo brevemente al seleccionar el nivel de urgencia porque no entendía la diferencia entre "urgente" y "muy urgente"; tras leer la descripción breve lo comprendió. Revisó el resumen antes de enviar y encontró el estado "Pendiente de validación" claro. Como observación positiva destacó que le habría tomado horas difundir una solicitud por WhatsApp y Facebook, mientras que con SangreLima lo hizo en menos de dos minutos. Sugirió agregar una estimación de tiempo de respuesta para que el solicitante sepa cuándo esperar noticias.

---

**Entrevista 2**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Luana Espinoza Cruz |
| Edad | 18 años |
| Distrito | Puente Piedra |
| Duración de la entrevista | 21 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Luana Espinoza Cruz, estudiante de Medicina Humana, realizó la validación del Landing Page y del flujo completo de solicitud y seguimiento en iOS. En el Landing Page identificó correctamente la propuesta de valor y navegó hacia la sección de solicitudes urgentes sin dificultad; comentó que la información de los tipos de sangre en las tarjetas le resultó familiar dado su contexto académico. En el flujo de la aplicación completó el registro de solicitud de forma fluida, mostrando especial interés en el campo de compatibilidad sanguínea. Señaló que la validación del centro de salud es un elemento diferenciador importante porque da credibilidad a la solicitud frente a publicaciones en redes sociales que pueden ser falsas. Al revisar el estado de la solicitud y la cantidad de donantes que confirmaron, valoró positivamente la visibilidad del avance en tiempo real. Como punto de mejora indicó que le gustaría ver una breve descripción sobre qué ocurre después de que un donante confirma, para poder comunicárselo a su familiar paciente. La experiencia en Android la encontró coherente con iOS, aunque percibió que el formulario se veía algo comprimido en pantallas pequeñas.

---

**Entrevista 3**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Carlos Salcedo |
| Edad | 19 años |
| Distrito | San Martín de Porres |
| Duración de la entrevista | 17 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Carlos Salcedo validó el Landing Page y el flujo de solicitud urgente en iOS y Android. Al explorar el Landing Page expresó que le pareció claro y ordenado; encontró la sección "¿Cómo funciona?" especialmente útil porque le explicó el proceso en tres pasos sencillos antes de usar la app. En el flujo de solicitud completó todos los campos sin asistencia y envió la solicitud exitosamente. Al probar el camino alterno —dejar vacío el campo de tipo de sangre— la aplicación mostró un mensaje de error que él consideró comprensible. Destacó como punto positivo que el badge "Validada" en las solicitudes le generó más confianza que las publicaciones que veía en grupos de Facebook, donde no había forma de saber si eran reales. Indicó que al principio no encontró de inmediato el botón para ver el estado de su solicitud y tuvo que buscar en el menú; sugirió que debería ser más visible tras el envío exitoso. En general valoró la experiencia de forma positiva y mencionó que recomendaría la aplicación a su familia.

---

#### Segmento 2: Donantes voluntarios

**Entrevista 1**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Herencia Saenz, José Gonzalo |
| Edad | 30 años |
| Distrito | Puente Piedra |
| Duración de la entrevista | 22 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** José Gonzalo Herencia Saenz validó el Landing Page y el flujo de respuesta a una alerta de donación en iOS. En el Landing Page comprendió la propuesta de valor para donantes; señaló que la sección de beneficios le aclaró cómo funcionaría la alerta y qué se esperaba de él como donante. Al recibir la notificación de alerta en la aplicación, abrió el detalle y revisó el tipo de sangre requerido, el nombre del centro de salud y la distancia aproximada. Indicó que el sello de validación del centro de salud fue determinante para que se sintiera seguro de confirmar: "si lo valida el hospital, sé que es real". Completó la confirmación con un solo toque sin dificultad. Al revisar las instrucciones para acudir a donar encontró la información clara, aunque sugirió añadir un mapa o indicaciones de cómo llegar al centro. Como observación señaló que al principio dudó en tocar el botón de confirmación porque no sabía si podría cancelar después; una vez que leyó que sí podía declinar, procedió con confianza.

---

**Entrevista 2**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Vega Pérez, John Austin |
| Edad | 22 años |
| Distrito | Chiclayo |
| Duración de la entrevista | 19 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** John Austin Vega Pérez, donante frecuente con experiencia previa en campañas universitarias, realizó la validación del flujo de alerta y confirmación en iOS y Android. Al ingresar al Landing Page navegó rápidamente y encontró de inmediato la sección orientada a donantes; comentó que el diseño era limpio y que la información era suficiente para entender el producto sin necesidad de leer todo el contenido. En el flujo de la aplicación recibió la alerta, revisó los detalles de la solicitud y confirmó su disponibilidad en menos de un minuto, señalando que el proceso era notablemente más directo que enterarse de solicitudes por TikTok o Instagram. Probó también el camino alterno de declinar la solicitud y encontró que el flujo era igualmente sencillo. Como mejora propuso que la alerta mostrara directamente la distancia al centro sin necesidad de abrir el detalle, para facilitar la decisión rápida. Valoró positivamente que las instrucciones previas a la donación incluyeran los requisitos de salud, ya que eso le permitiría prepararse antes de salir.

---

**Entrevista 3**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Villanueva Azulca, Fely Gabriela |
| Edad | 20 años |
| Distrito | Ate |
| Duración de la entrevista | 20 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Fely Gabriela Villanueva Azulca, con una única experiencia previa como donante, realizó la validación del flujo de alerta, confirmación e instrucciones en iOS. En el Landing Page mostró cierta cautela inicial; sin embargo, al identificar el texto que menciona la validación por centros de salud su actitud cambió y comentó que eso era exactamente lo que necesitaría para confiar en una solicitud. En la aplicación recibió la alerta y abrió el detalle; revisó detenidamente el badge de validación del hospital antes de tomar una decisión, lo cual llevó algo más de tiempo que en los otros participantes. Una vez verificado, confirmó su disponibilidad sin dificultad. Al revisar las instrucciones previas a la donación señaló que le generó tranquilidad saber de antemano qué exámenes le realizarían, porque en su primera donación no supo qué esperar y eso incrementó su ansiedad. Como sugerencia propuso agregar una sección de preguntas frecuentes accesible desde el detalle de la alerta. La experiencia en Android la encontró coherente con iOS.

---

#### Segmento 3: Centros de salud y bancos de sangre

**Entrevista 1**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Santiago Salinas, Dylan Jonathan |
| Edad | 28 años |
| Distrito | Surco |
| Institución | Clínica Doctus |
| Duración de la entrevista | 25 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Dylan Jonathan Santiago Salinas, licenciado en enfermería en el área de emergencias, realizó la validación del Landing Page y del flujo de validación de solicitudes y registro de donación en iOS y Android. En el Landing Page reconoció la propuesta de valor para centros de salud y señaló que el mensaje sobre "solicitudes validadas por establecimientos de salud" era consistente con la responsabilidad que asumen los hospitales en este proceso. En el flujo de validación de solicitudes revisó la información del solicitante y los datos clínicos, aprobó la solicitud sin dificultad y encontró el flujo lógico y ordenado. Indicó que el tiempo promedio de validación en su clínica es de alrededor de un día y medio, y que una interfaz tan directa podría reducirlo considerablemente. Al registrar la llegada del donante y completar la donación encontró los pasos claros. Como observación técnica señaló que sería conveniente incluir campos adicionales para el resultado de los exámenes previos del donante, ya que esa información es parte del protocolo estándar. Destacó que cualquier herramienta de este tipo debe estar respaldada legalmente y por profesionales de la salud para garantizar la legitimidad de las solicitudes.

---

**Entrevista 2**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Quispe Flores, Mayra |
| Edad | 32 años |
| Distrito | Jesús María |
| Institución | Banco de Sangre — Clínica San Felipe |
| Duración de la entrevista | 23 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Mayra Quispe Flores, coordinadora administrativa del banco de sangre de la Clínica San Felipe, realizó la validación del Landing Page y los flujos de aprobación de solicitudes y registro de donación en iOS. En el Landing Page comprendió rápidamente el modelo de operación y consideró que la información estaba bien organizada para el perfil de personal de salud. En el flujo de validación de solicitudes revisó los datos del paciente y el tipo de sangre requerido, aprobó la solicitud y probó también el flujo de rechazo con motivo, que encontró completo y funcional. Señaló que en su trabajo actual el proceso de validación se realiza con formularios físicos combinados con hojas de cálculo, por lo que una interfaz digital unificada como la de SangreLima simplificaría notablemente su flujo de trabajo. Al registrar la donación completada encontró los pasos intuitivos. Como mejora propuso que el sistema genere automáticamente un comprobante digital para el donante y un registro para el banco de sangre, ya que actualmente ese paso se hace de forma manual. Valoró especialmente la trazabilidad que ofrece la plataforma al mantener el historial de solicitudes y donaciones en un mismo lugar.

---

**Entrevista 3**

| Campo | Detalle |
|---|---|
| Nombre y apellidos | Ccari Mendoza, Roberto |
| Edad | 45 años |
| Distrito | San Borja |
| Institución | Hospital Nacional Arzobispo Loayza |
| Duración de la entrevista | 27 minutos |
| URL del video | *(pendiente de subida a YouTube)* |
| Timing de inicio | *(pendiente)* |

> *(Insertar screenshot del cuadro de video)*

**Resumen:** Roberto Ccari Mendoza, técnico de laboratorio con más de quince años de experiencia en el Hospital Nacional Arzobispo Loayza, realizó la validación del Landing Page y los flujos de validación de solicitudes y registro de donación en iOS. Al explorar el Landing Page tomó más tiempo que los otros participantes de este segmento en identificar la sección de beneficios para centros de salud; sugirió que esa información debería estar más visible desde el inicio, ya que el personal de salud tiene menos tiempo disponible para explorar. En el flujo de validación de solicitudes necesitó una breve orientación para localizar la bandeja de solicitudes pendientes, pero una vez dentro completó la aprobación sin dificultad. Señaló que la posibilidad de rechazar una solicitud con un motivo específico es un requisito indispensable para los protocolos hospitalarios, y valoró que el flujo lo contemplara. Al registrar la llegada del donante encontró el paso de confirmar la evaluación previa algo ambiguo y preguntó si se refería a los exámenes de hemoglobina o a una evaluación general; recomendó aclarar el nombre del campo. En general consideró que la herramienta tiene potencial para mejorar la coordinación entre pacientes, donantes y centros de salud, siempre que cuente con la validación normativa del Ministerio de Salud.

### 6.2.3. Evaluaciones según heurísticas

> Escala de severidad : se utilizará una escala del 0 al 4 para indicar qué tan grave es cada dificultad identificada durante las pruebas:

- 0 – No es un problema: no afecta el uso de la plataforma.

- 1 – Cosmético: es un detalle visual o de presentación que no dificulta el uso.

- 2 – Menor: es una pequeña dificultad, pero el usuario puede continuar sin mayores inconvenientes.

- 3 – Mayor: es un problema que dificulta completar una tarea y necesita corregirse.

- 4 – Catastrófico: es un problema que impide completar una tarea importante o afecta gravemente su funcionamiento.

1.  Heurísticas de usabilidad:

| \# | Heurística | Como se observó en SangreLima |
|----|----|----|
| H1 | Visibilidad del estado del sistema | ¿Entendió el estado de la solicitud (Pendiente, Validada, Activa, Cubierta) y el progreso de confirmaciones? |
| H2 | Coincidencia con el mundo real | ¿Entendió las etiquetas ("Donantes compatibles", "Puedo donar") sin jerga técnica? |
| H3 | Control y libertad del usuario | ¿Pudo volver atrás, editar antes de enviar (US07) o declinar (US31)? |
| H4 | Consistencia y estándares | ¿Los patrones coinciden con iOS y Android? ¿Los botones primarios se comportan igual en todas las pantallas? |
| H5 | Prevención de errores | ¿Las confirmaciones, validaciones de campos y alertas evitaron errores (unidades inválidas, solicitudes duplicadas)? |
| H6 | Reconocimiento antes que recuerdo | ¿Encontró cada opción sin tener que recordarla? |
| H7 | Flexibilidad y eficiencia | ¿Resultó rápido el flujo core (máximo 2 toques desde Inicio, confirmación con un toque)? |
| H8 | Diseño estético y minimalista | ¿Cada pantalla mostró solo la información necesaria, con jerarquía clara? |
| H9 | Ayuda a reconocer y corregir errores | ¿Los mensajes de error explicaron qué pasó y cómo corregirlo? |
| H10 | Ayuda y documentación | ¿Encontró indicaciones (requisitos, instrucciones para acudir) cuando las necesitó? |

2.  Heurísticas de arquitectura de información

| **\#** | **Heurística** | **Cómo se observó** |
|----|----|----|
| IA1 | Organización | ¿La agrupación en Inicio, Solicitudes, Centros y Perfil le resultó natural? |
| IA2 | Etiquetado | ¿Las etiquetas de navegación y botones se entendieron al primer vistazo? |
| IA3 | Navegación | ¿Supo dónde estaba y cómo volver? ¿Funcionó el Tab Bar y la navegación desde la notificación? |
| IA4 | Búsqueda y filtros | ¿Los filtros por distancia, urgencia, estado o centro fueron útiles y comprensibles? |

3.  Heurísticas de diseño inclusivo y accesibilidad

| \# | Heurística | Cómo se observó |
|----|----|----|
| IN1 | No depender solo del color | ¿Entendió urgencia y validación gracias al texto y a los íconos, no solo al color? |
| IN2 | Legibilidad y contraste | ¿Pudo leer textos, grupos sanguíneos y botones sin esfuerzo? |
| IN3 | Tamaño y espacio táctil | ¿Pudo tocar los controles sin errores? |
| IN4 | Lenguaje claro y tono | ¿El tono le pareció respetuoso y no alarmista? |
| IN5 | Atención a distintas capacidades y contextos | ¿Qué barreras surgieron para usar la app con estrés, prisa o poca experiencia con tecnología? |

Entrevista 1:

| Heurística | Cumple (Sí / Parcial / No) | Evidencia o comentario del entrevistado | Severidad (0 a 4) | Mejora propuesta |
|----|----|----|----|----|
|  |  |  |  |  |

**Avance de Conclusiones, Bibliografía y Anexos**