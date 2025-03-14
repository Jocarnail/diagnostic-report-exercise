#show: report.with(
    $if(title)$
        title: "$title$",
    $endif$

    $if(company-logo)$
        company_logo: "$company-logo$",
    $endif$

    $if(company-address)$
        company_address: (
            street: "$company-address.street$",
            city: "$company-address.city$",
            cap: "$company-address.cap$"
        ),
    $endif$

    $if(company-contact)$
        company_contact: (
            $if(company-contact.phone)$ phone: "$company-contact.phone$", $endif$
            $if(company-contact.email)$ email: "$company-contact.email$", $endif$
        ),
    $endif$

    $if(patient)$
        patient: (
            id: $patient.id$,
            name: "$patient.name$",
            birth_date: "$patient.birth-date$"
        ),
    $endif$

    $if(report)$
        report: (
            id: $report.id$,
            date: "$report.date$"
        ),
    $endif$

)