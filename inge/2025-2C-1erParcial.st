!classDefinition: #Ambiente category: #'2025-2C-1erParcial'!
Object subclass: #Ambiente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Ambiente methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 20:59:13'!
especimen: especimen esCapturadaAcaUsandoAspiradorPor: rover

	self subclassResponsibility! !

!Ambiente methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 20:59:24'!
especimen: especimen esCapturadaAcaUsandoRedPor: rover

	self subclassResponsibility! !


!classDefinition: #Fangoso category: #'2025-2C-1erParcial'!
Ambiente subclass: #Fangoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Fangoso methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:49:35'!
especimen: especimen esCapturadaAcaUsandoAspiradorPor: rover
^especimen  esCapturadaEnFangosoUsandoAspiradorDentroDe:  (rover areaBarridoConTamaño: 3@3) ! !

!Fangoso methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:45:14'!
especimen: especimen esCapturadaAcaUsandoRedPor: rover
	^especimen esCapturadaEnFangosoUsandoRedDentroDe: (rover areaBarridoConTamaño: 3@1)! !


!classDefinition: #Rocoso category: #'2025-2C-1erParcial'!
Ambiente subclass: #Rocoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Rocoso methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:45:32'!
especimen: especimen esCapturadaAcaUsandoAspiradorPor: rover
	^especimen esCapturadaEnRocosoUsandoAspiradorDentroDe: (rover areaBarridoConTamaño: 3@2)! !

!Rocoso methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:01:04'!
especimen: especimen esCapturadaAcaUsandoRedPor: rover
	rover romperBrazo ! !


!classDefinition: #Brazo category: #'2025-2C-1erParcial'!
Object subclass: #Brazo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Brazo methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 20:55:29'!
capturaEspecimen: especimen porRover: rover enAmbiente: ambiente

	self subclassResponsibility! !


!classDefinition: #Aspirador category: #'2025-2C-1erParcial'!
Brazo subclass: #Aspirador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Aspirador methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:03:21'!
capturaEspecimen: especimen porRover: rover enAmbiente: ambiente

	^ambiente especimen: especimen  esCapturadaAcaUsandoAspiradorPor: rover ! !


!classDefinition: #BrazoRed category: #'2025-2C-1erParcial'!
Brazo subclass: #BrazoRed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!BrazoRed methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:03:23'!
capturaEspecimen: especimen porRover: rover enAmbiente: ambiente

	^ambiente especimen: especimen  esCapturadaAcaUsandoRedPor: rover ! !


!classDefinition: #Contingencia category: #'2025-2C-1erParcial'!
Brazo subclass: #Contingencia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Contingencia methodsFor: 'EspecimenCapturada' stamp: 'L.H. 10/3/2025 21:53:12'!
capturaEspecimen: especimen porRover: rover enAmbiente: ambiente

	^especimen  esCapturadaUsandoContingenciaDentroDe: (rover areaBarridoConTamaño: 1@1) ! !


!classDefinition: #Especimen category: #'2025-2C-1erParcial'!
Object subclass: #Especimen
	instanceVariableNames: 'posicion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Especimen methodsFor: 'Condiciones' stamp: 'L.H. 10/3/2025 19:01:43'!
en: posicionEsperada
	^ posicion = posicionEsperada ! !

!Especimen methodsFor: 'Condiciones' stamp: 'L.H. 10/3/2025 21:29:06'!
estaDentroDe: areaBarrida 

	^areaBarrida containsPoint: posicion! !

!Especimen methodsFor: 'Condiciones' stamp: 'L.H. 10/3/2025 21:16:05'!
hacerYVerificaPresencia: bloque siEstaDentroDe: areaBarrida 
	(self estaDentroDe: areaBarrida)  ifTrue: bloque.
	^ (self estaDentroDe: areaBarrida)

	! !


!Especimen methodsFor: 'Movimiento' stamp: 'L.H. 10/3/2025 18:53:01'!
mover: distancia
	posicion := posicion + distancia ! !


!Especimen methodsFor: 'Inicialización' stamp: 'L.H. 10/3/2025 19:12:44'!
inicializarEn: unaPosicion
	posicion  := unaPosicion ! !


!Especimen methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:51:57'!
esCapturadaEnFangosoUsandoAspiradorDentroDe: areaBarrida
self subclassResponsibility ! !

!Especimen methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:51:21'!
esCapturadaEnFangosoUsandoRedDentroDe: areaBarrida
self subclassResponsibility ! !

!Especimen methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:51:29'!
esCapturadaEnRocosoUsandoAspiradorDentroDe: areaBarrida
self subclassResponsibility ! !

!Especimen methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:52:49'!
esCapturadaUsandoContingenciaDentroDe: areaBarrida
	^ self estaDentroDe: areaBarrida! !


!classDefinition: #Escurridizo category: #'2025-2C-1erParcial'!
Especimen subclass: #Escurridizo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Escurridizo methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:46:03'!
esCapturadaEnFangosoUsandoAspiradorDentroDe: areaBarrida
	^ self hacerYVerificaPresencia: [
			self mover: 1@1.
		] siEstaDentroDe:  areaBarrida.
	! !

!Escurridizo methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:46:15'!
esCapturadaEnFangosoUsandoRedDentroDe: areaBarrida
	^ self hacerYVerificaPresencia: [
			self mover: -1@0.
		] siEstaDentroDe:  areaBarrida.
	! !

!Escurridizo methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:46:26'!
esCapturadaEnRocosoUsandoAspiradorDentroDe: areaBarrida
	^ self hacerYVerificaPresencia: [
			self mover: 0@1.
		] siEstaDentroDe: areaBarrida.
	! !


!classDefinition: #Perezoso category: #'2025-2C-1erParcial'!
Especimen subclass: #Perezoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!Perezoso methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:46:41'!
esCapturadaEnFangosoUsandoAspiradorDentroDe: areaBarrida
^ self estaDentroDe:  areaBarrida! !

!Perezoso methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:46:48'!
esCapturadaEnFangosoUsandoRedDentroDe: areaBarrida
^ false! !

!Perezoso methodsFor: 'EsCapturada' stamp: 'L.H. 10/3/2025 21:46:58'!
esCapturadaEnRocosoUsandoAspiradorDentroDe: areaBarrida
	^ self estaDentroDe: areaBarrida! !


!classDefinition: #RoverMarino category: #'2025-2C-1erParcial'!
Object subclass: #RoverMarino
	instanceVariableNames: 'brazo posición mapa biobox'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!RoverMarino methodsFor: 'Acciones' stamp: 'L.H. 10/3/2025 21:30:12'!
romperBrazo

	brazo := Contingencia new.
			self error: self class brazoDañadoErrorMessage! !

!RoverMarino methodsFor: 'Acciones' stamp: 'L.H. 10/3/2025 21:24:33'!
simularCapturaEnAmbiente: ambiente

		
	biobox addAll: (mapa select: [ :especimen | brazo capturaEspecimen: especimen porRover: self  enAmbiente: ambiente ]).
	mapa removeAllSuchThat: [:especimen | biobox includes: especimen ].
! !


!RoverMarino methodsFor: 'Tests' stamp: 'L.H. 10/3/2025 18:24:16'!
verificarCapturaDeEspecimen: especimenBuscada
	^biobox includes: especimenBuscada .
! !


!RoverMarino methodsFor: 'Getters' stamp: 'L.H. 10/3/2025 21:11:02'!
areaBarridoConTamaño: tamaño
	^Rectangle origin: posición extent: tamaño ! !


!RoverMarino methodsFor: 'Errores' stamp: 'L.H. 10/3/2025 21:35:11'!
afirmarMapaTieneEspecimenes: unMapa

	^ unMapa isEmpty ifTrue: [
			self error: self class elMapaDebeTenerEspecimenesErrorMessage.
		]! !


!RoverMarino methodsFor: 'Inicialización' stamp: 'L.H. 10/3/2025 21:35:11'!
inicializarConBrazo: unBrazo mapa: unMapa posición: unaPosición

	brazo := unBrazo .
	
	self afirmarMapaTieneEspecimenes: unMapa.
	mapa  := unMapa .
	posición := unaPosición.
	biobox := Bag new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverMarino class' category: #'2025-2C-1erParcial'!
RoverMarino class
	instanceVariableNames: ''!

!RoverMarino class methodsFor: 'error messages' stamp: 'NR 10/3/2025 06:08:53'!
brazoDañadoErrorMessage

	^ 'El brazo se ha dañado. Imposible capturar' ! !

!RoverMarino class methodsFor: 'error messages' stamp: 'NR 10/3/2025 06:08:35'!
elMapaDebeTenerEspecimenesErrorMessage

	^ 'El mapa debe tener al menos un especimen para capturar'! !


!classDefinition: #CapturaSubmarinaTest category: #'2025-2C-1erParcial'!
TestCase subclass: #CapturaSubmarinaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-1erParcial'!

!CapturaSubmarinaTest methodsFor: 'especimenes' stamp: 'L.H. 10/3/2025 19:08:12'!
especimenEscurridizo

	^Escurridizo new.! !

!CapturaSubmarinaTest methodsFor: 'especimenes' stamp: 'L.H. 10/3/2025 19:08:06'!
especimenPerezoso
	^Perezoso new! !


!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:08'!
test01LasSimulacionesDebenTenerEspecimenesACapturar

	self should: [ self roverConAspiradorUtilizando: self mapaVacio paradoSobre: 0@0 ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :exception | self assert: exception messageText = RoverMarino elMapaDebeTenerEspecimenesErrorMessage ]


! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:15'!
test02ElRoverUtilizandoBrazoAspiradorEnSueloFangosoCapturaUnEspecimenPerezosoEnSuAreaDeAgarre

	|unRoverMaritimo unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 0@1.
	unRoverMaritimo := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@0.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMaritimo.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMaritimo).
	self deny: (self mapa: unMapa contiene: unEspecimenPerezoso)

	"   0 1 2 3 4
	0  x x x o o
	1  P x x o o
	2  x x x o o
	3  o o o o o
	4  o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:19'!
test03ElRoverUtilizandoBrazoAspiradorEnSueloFangosoNoCapturaUnEspecimenPerezosoFueraDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 0@1.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 0@1)

	"   0 1 2 3 4
	0  o o o o o
	1  P x x x o
	2  o x x x o
	3  o x x x o
	4  o o o o o

	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:22'!
test04ElRoverUtilizandoBrazoAspiradorEnSueloFangosoNoCapturaUnEspecimenEscurridizoQueSeMueveFueraDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@0.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 2@3)

	"   0 1 2 3 4 5               0 1 2 3 4 5
	0  o x x x o o           0  o x x x o o
	1  o x x x o o           1  o x x x o o
	2  o E x x o o   ->  2  o x x x o o
	3  o o o o o o          3  o o E o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:25'!
test05ElRoverUtilizandoBrazoAspiradorEnSueloFangosoCapturaUnEspecimenEscurridizoQueSeMueveDentroDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo)

	"   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o x x x o o           1  o x x x o o
	2  o E x x o o   ->  2  o x x x o o
	3  o x x x o o          3  o x E x o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:28'!
test06ElRoverUtilizandoBrazoAspiradorEnSueloRocosoNoCapturaUnEspecimenPerezosoEnAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 2@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@0.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 2@2)

	"   0 1 2 3 4 5
	0  x x x o o o
	1  x x x o o o
	2  o o P o o o
	3  o o o o o o
	4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:31'!
test07ElRoverUtilizandoBrazoAspiradorEnSueloRocosoCapturaUnEspecimenPerezosoEnAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 2@2.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@1.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenPerezoso)

      "   0 1 2 3 4 5
	0  o o o o o o
	1  x x x o o o
	2  x x P o o o
	3  o o o o o o
	4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:34'!
test08ElRoverUtilizandoBrazoAspiradorEnSueloRocosoNoCapturaUnEspecimenEscurridizoQueSeMueveFueraDeAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 2@1.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@0.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 2@2)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  x x x o o o           0  x x x o o o
	1  x x E o o o           1  x x x o o o
	2  o o o o o o   ->  2  o o E o o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:37'!
test09ElRoverUtilizandoBrazoApiradorEnSueloRocosoCapturaUnEspecimenEscurridizoQueSeMueveFueraDeAreaDeAgarreReducida

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 2@1.
	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 0@1.

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo)

     "     0 1 2 3 4 5              0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  x x E o o o           1  x x x o o o
	2  x x x o o o   ->  2  x x E o o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:42'!
test10ElRoverUtilizandoBrazoRedEnSueloFangosoNoCapturaUnEspecimenPerezoso

	|unRoverMarino unMapa unEspecimenPerezoso |

	unEspecimenPerezoso:= self especimenPerezoso.
	unMapa := self mapaCon: unEspecimenPerezoso en: 0@1.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 0@1)

	"   0 1 2 3 4
	0  o o o o o
	1  P x x x o
	2  o o o o o
	3  o o o o o
	4  o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:45'!
test11ElRoverUtilizandoBrazoRedEnSueloFangosoNoCapturaUnEspecimenEscurridizoQueSeMueveFueraDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 1@2.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 0@2)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o           1  o o o o o o
	2  o E x x x o   ->  2  E x x x x o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:49'!
test12ElRoverUtilizandoBrazoRedEnSueloFangosoCapturaUnEspecimenEscurridizoQueSeMueveDentroDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unMapa := self mapaCon: unEspecimenEscurridizo en: (1@2).
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o          1  o o o o o o
	2  x E x x o o   ->  2  E x x x o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:52'!
test13ElRoverUtilizandoBrazoRedEnSueloRocosoNoCapturaNingunEspecimenYRompeLaRed

	|unRoverMarino unMapa unEspecimenEscurridizo unEspecimenPerezoso |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unEspecimenPerezoso := self especimenPerezoso.

	unMapa := self mapaCon: unEspecimenEscurridizo en: 0@2 y: unEspecimenPerezoso en: 1@2.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self should: [self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:exception |
		self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
		self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
		self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 0@2).
		self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 1@2).

		self assert: exception messageText = RoverMarino brazoDañadoErrorMessage
	]

	"   0 1 2 3 4 5 6
	0  o o o o o o o
	1  o o o o o o o
	2  E P x x x x o
	3  o o o o o o o
	4  o o o o o	 o o
	"
! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:56'!
test14ElRoverCapturaTodosLosEspecimenesDentroDelAreaDeAgarre

	|unRoverMarino unMapa unEspecimenEscurridizo otroEspecimenEscurridizo |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	otroEspecimenEscurridizo:= self especimenEscurridizo.

	unMapa := self mapaCon: unEspecimenEscurridizo en: 1@2 y: otroEspecimenEscurridizo en: 2@2.

	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self verificarCapturaDeEspecimen: otroEspecimenEscurridizo por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo).
	self deny: (self mapa: unMapa contiene: otroEspecimenEscurridizo)

      "   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o          1   o o o o o o
	2  x E E x x x   ->  2  x x x o o o
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:00:59'!
test15ElRoverCapturaTodosLosEspecimenesAunSiEstanEnLaMismaPosicion

	|unRoverMarino unMapa unEspecimenEscurridizo otroEspecimenPerezoso |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	otroEspecimenPerezoso:= self especimenPerezoso.

	unMapa := self mapaCon:  unEspecimenEscurridizo en: 1@2 y: otroEspecimenPerezoso en: 2@3.

	unRoverMarino := self roverConAspiradorUtilizando: unMapa paradoSobre: 1@1.

	self simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self assert: (self verificarCapturaDeEspecimen: otroEspecimenPerezoso por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo).
	self deny: (self mapa: unMapa contiene: otroEspecimenPerezoso)

	"   0 1 2 3 4 5               0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o x x x o o           1  o x x x o o
	2  o E x x o o   ->  2  o x x x o o
	3  o x P x o o          3  o x x x o o
	4  o o o o o o          4  o o o o o o
	"

	! !

!CapturaSubmarinaTest methodsFor: 'tests' stamp: 'NR 10/3/2025 06:01:02'!
test16ElRoverUtilizandoBrazoRedEnSueloRocosoSeRompeYCambiaAModoContingencia

	|unRoverMarino unMapa unEspecimenEscurridizo unEspecimenPerezoso |

	unEspecimenEscurridizo:= self especimenEscurridizo.
	unEspecimenPerezoso := self especimenPerezoso.

	unMapa := self mapaCon: unEspecimenEscurridizo en: 0@2 y: unEspecimenPerezoso en: 1@2.
	unRoverMarino := self roverConRedUtilizando: unMapa paradoSobre: 0@2.

	self should: [self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:exception |
		self deny: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
		self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
		self assert: (self mapa: unMapa contiene: unEspecimenEscurridizo en: 0@2).
		self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 1@2).

		self assert: exception messageText = RoverMarino brazoDañadoErrorMessage .
	].

	 "  0 1 2 3 4 5              0 1 2 3 4 5
	0  o o o o o o           0  o o o o o o
	1  o o o o o o           1  o o o o o o
	2  E P x x x x   ->  2  x P x x x x
	3  o o o o o o          3  o o o o o o
	4  o o o o o o          4  o o o o o o
	"

	"Se hacen las capturas en modo contingencia"

	self simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRoverMarino.

	self assert: (self verificarCapturaDeEspecimen: unEspecimenEscurridizo por: unRoverMarino).
	self deny: (self verificarCapturaDeEspecimen: unEspecimenPerezoso por: unRoverMarino).
	self deny: (self mapa: unMapa contiene: unEspecimenEscurridizo).
	self assert: (self mapa: unMapa contiene: unEspecimenPerezoso en: 1@2)
! !


!CapturaSubmarinaTest methodsFor: 'simulaciones' stamp: 'L.H. 10/3/2025 21:27:01'!
simularCapturaUtilizando: unMapa capturandoCon: unRover enAmbiente: unAmbiente

	unRover simularCapturaEnAmbiente: unAmbiente 
! !


!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'L.H. 10/3/2025 19:10:08'!
mapaCon: unEspecimen en: unaPosicion
	|mapa|
	mapa := self mapaVacio. 
	mapa add: (unEspecimen inicializarEn: unaPosicion ) .
	^mapa! !

!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'L.H. 10/3/2025 19:23:37'!
mapaCon: unEspecimen en: unaPosicion y: otroEspecimen en: otraPosicion
	|mapa|
	mapa := self mapaCon: unEspecimen en: unaPosicion. 
	mapa add: (otroEspecimen inicializarEn: otraPosicion ) .
	^mapa! !

!CapturaSubmarinaTest methodsFor: 'mapas' stamp: 'L.H. 10/3/2025 18:59:22'!
mapaVacio

	^OrderedCollection new.! !


!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'L.H. 10/3/2025 20:29:09'!
mapa: unMapa contiene: unEspecimen
	^unMapa includes: unEspecimen .
	 ! !

!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'L.H. 10/3/2025 20:29:29'!
mapa: unMapa contiene: unEspecimen en: unPunto

	^(unMapa includes: unEspecimen) and: [unEspecimen en: unPunto] ! !

!CapturaSubmarinaTest methodsFor: 'assertions' stamp: 'L.H. 10/3/2025 18:24:42'!
verificarCapturaDeEspecimen: unEspecimen por: unRover

	^unRover verificarCapturaDeEspecimen: unEspecimen .! !


!CapturaSubmarinaTest methodsFor: 'rover' stamp: 'L.H. 10/3/2025 21:25:18'!
roverConAspiradorUtilizando: unMapa paradoSobre: unPunto

	^RoverMarino new inicializarConBrazo: Aspirador new mapa: unMapa  posición: unPunto! !

!CapturaSubmarinaTest methodsFor: 'rover' stamp: 'L.H. 10/3/2025 21:25:47'!
roverConRedUtilizando: unMapa paradoSobre: unPunto

	^RoverMarino new inicializarConBrazo: BrazoRed  new mapa: unMapa  posición: unPunto! !


!CapturaSubmarinaTest methodsFor: 'ambientes' stamp: 'L.H. 10/3/2025 21:25:56'!
simularCapturaEnAmbienteFangosoUtilizando: unMapa capturandoCon: unRover

	unRover simularCapturaEnAmbiente: Fangoso new! !

!CapturaSubmarinaTest methodsFor: 'ambientes' stamp: 'L.H. 10/3/2025 21:26:03'!
simularCapturaEnAmbienteRocosoUtilizando: unMapa capturandoCon: unRover

	unRover simularCapturaEnAmbiente: Rocoso new! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 56 60 63 53 112 116 104 110 108 17 124 117 112 127 17 115 112 117 124 127 52 110 117 124 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 60 57 61 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 84 104 121 39 57 58 39 57 55 57 60 39 56 56 65 57 61 65 59 63 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 60 57 61 39 124 124 112 107 65 39 58 62 105 104 64 109 61 64 52 105 62 56 108 52 59 106 106 60 52 63 107 62 105 52 108 56 109 58 63 64 64 64 63 107 56 107 39 84 104 121 39 57 58 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 60 57 61 39 124 124 112 107 65 39 58 62 105 104 64 109 61 64 52 105 62 56 108 52 59 106 106 60 52 63 107 62 105 52 108 56 109 58 63 64 64 64 63 107 56 107 39 84 104 121 39 57 58 39 57 55 57 60 17 93 84 65 39 57 55 57 60 55 58 57 55 56 63 56 55 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 83 112 125 108 91 128 119 112 117 110 52 74 118 110 93 84 52 72 117 110 108 115 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 91 111 124 39 84 104 121 39 57 55 39 56 59 65 56 55 65 60 64 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 64 58 59 104 60 58 106 58 105 39 87 115 124 110 112 117 122 65 39 57 55 57 60 55 58 57 55 56 63 56 55 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 83 112 125 108 91 128 119 112 117 110 52 74 118 110 93 84 52 72 117 110 108 115 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 17 48 112 38 17 56 55 53 59 56 53 56 55 60 53 58 56 17 119 106 58 56 53 115 104 105 56 56 55 60 53 115 104 105 118 122 53 109 106 108 117 53 124 105 104 53 104 121 17 119 106 58 56 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 56 62 65 58 60 65 60 60 53 60 64 58 63 60 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 53 122 123 17 56 62 63 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 57 55 65 55 56 65 56 63 53 61 59 61 55 60 60 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 57 53 122 123 17 57 56 62 60 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 57 55 65 57 63 65 57 57 53 59 56 59 56 60 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 77 124 117 106 112 118 117 104 74 118 117 86 121 108 121 108 107 74 118 115 115 108 106 123 112 118 117 53 122 123 17 57 58 57 59 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 57 56 65 57 58 65 56 63 53 59 57 57 63 62 61 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 72 85 91 76 92 83 91 80 84 72 53 122 123 17 57 62 57 63 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 57 56 65 58 63 65 58 56 53 63 61 56 60 61 56 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 72 85 91 76 92 83 91 80 84 72 75 76 93 76 89 75 72 75 53 122 123 17 57 61 63 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 57 56 65 58 64 65 58 59 53 61 63 64 59 58 63 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 72 72 72 72 92 83 91 80 84 72 53 122 123 17 57 60 64 64 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 55 58 91 57 56 65 60 58 65 58 61 53 62 62 56 56 58 64 52 55 58 65 55 55 17 54 111 118 116 108 54 76 122 123 124 107 112 104 117 123 108 54 76 122 106 121 112 123 118 121 112 118 54 115 112 117 124 127 61 59 47 56 48 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 56 108 121 87 104 121 106 112 104 115 77 80 85 72 83 53 122 123 17 57 61 56 55 57 17 52 52 52 52 52 52 52 52 52 52 17 17))!