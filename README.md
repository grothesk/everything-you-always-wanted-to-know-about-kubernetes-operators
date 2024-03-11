# everything-you-always-wanted-to-know-about-kubernetes-operators

 Was Sie schon immer über Kubernetes Operatoren wissen wollten, aber bisher nicht zu fragen wagten.

 ## Operator Pattern

Operatoren erweitern die Funktionalität von Kubernetes.

Das sogenannte Operator Pattern handelt von zwei Komponenten:
* einer CustomResource und 
* einem containerisierten "Regler" bzw Controller, der einen Sollzustand in den Istzustand überführt.

Bei der Installation vom Operatoren ergeben sich somit die folgenden Aufgaben:
* die Erweiterung der Kubernetes-API durch CustomResourceDefinitions und
* das Deployment eines Controllers, der mit der Kubernetes-API interagiert

## Bewertung von Operatoren

Operator helfen dabei, ein Grundprinzip von Kubernetes zu verstehen: 
* das Zusammenspiel von der Beschreibung des Soll-Ist-Zuständen (Resource) und 
* Controllern, die Maßnahmen anhand des Soll-Ist-Zustandes vornehmen

In anderen Worten: Operatoren sind im klassischen Sinne Regler, die einen Soll-Ist-Abgleich vornehmen. Die Basis für den Abgleich ist der von der Kubernetes-API erfasste `State` (Spec + Status) in einer Resource.

Mit Operatoren lassen sich somit Automatisierungen deklarativ managen.

## Operator Frameworks

Es gibt eine Reihe von Operator Frameworks, mit denen eigene Operatoren entwickelt werden können.

Operator SDK unterstützt die Entwicklung mit
* Helm,
* Golang und
* Ansible.

Hauptvorteil von Operator SDK ist die Integration in Operator Lifecycle Management (OLM).

## Speedrun: Entwicklung eines Ansible-based Operators mit Operator SDK 

## Requirements
* Operator SDK (v1.32.0)

## Schritte 

1. Initialisiere das Operator-Projekt:
```bash
make init-operator-project
```

2. Passe die CustomResourceDefinition und das Sample an.

3. Schreibe die Ansible-Role.

4. Passe RBAC für den Controller an.

5. Passe ggf. die watches.yaml an.

6. Baue das Container-Image und lade es in ein Register hoch.

7. Deploye den Operator.

8. Teste den Operator.


## Sources

* Operator Pattern: [https://kubernetes.io/docs/concepts/extend-kubernetes/operator/](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)
* Operator Frameworks: [https://kubernetes.io/docs/concepts/extend-kubernetes/operator/#writing-operator](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/#writing-operator)
* Operator SDK: [https://sdk.operatorframework.io/](https://sdk.operatorframework.io/)
* Kubebuilder: [https://book.kubebuilder.io/](https://book.kubebuilder.io/)
* Operator Lifecyle Management: [https://olm.operatorframework.io/](https://olm.operatorframework.io/)


